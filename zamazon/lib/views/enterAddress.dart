import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:geolocator/geolocator.dart';

import '../globals.dart';
import '../widgets/addressSearchResults.dart';

class EnterAddress extends StatefulWidget {
  const EnterAddress({Key? key}) : super(key: key);

  @override
  State<EnterAddress> createState() => _EnterAddressState();
}

class _EnterAddressState extends State<EnterAddress> {
  bool isLoading = false;
  bool isResponseEmpty = true;
  bool hasResponded = false;
  bool isWaitingForLocation = false;

  String noRequest =
      'Start typing your address or use your current location by pressing locator button.';
  String noResponse = 'No results found.';
  String loadingText = 'Fetching Data... Please wait.';

  List responses = [];

  TextEditingController textController = TextEditingController();

  Timer? typingTimer;

  @override
  Widget build(BuildContext context) {
    Geolocator.isLocationServiceEnabled().then((value) => null);
    Geolocator.requestPermission().then((value) => null);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              locationField(),
              isLoading
                  ? const LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue))
                  : Container(),
              isResponseEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(
                        20,
                      ),
                      child: Center(
                          child: isLoading ? Text(loadingText) :
                          Text(hasResponded ? noResponse : noRequest,
                        textAlign: TextAlign.center,
                      )))
                  : Container(),
              addressSearchResults(responses, textController),
            ],
          ),
        ),
      ),
    );
  }

  Widget locationField() {
    return Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias, // TODO :test this
        // margin: const EdgeInsets.all(0), // this may be useful
        child: Container(
            padding: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: TextField(
                enabled: isWaitingForLocation ? false : true,
                controller: textController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: isWaitingForLocation ? null :
                          () => _useCurrentLocationButtonHandler(),
                      icon: const Icon(Icons.my_location)),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  labelText: "Address",
                ),
                onChanged: _onChangeHandler,
              ),
            )));
  }

  _onChangeHandler(value) {
    // when user is typing, it is loading
    setState(() {
      isLoading = true;
    });

    // waits for one second after user has stopped typing before
    // making requests. this prevents constant, unnecessary API requests
    if (typingTimer != null) {
      setState(() {
        typingTimer?.cancel();
      });
    }
    setState(() {
      typingTimer = Timer(const Duration(seconds: 1), () async {
        // get search results using Mapbox Search API
        List response = await getSearchResults(value);

        setState(() {
          responses = response;
          hasResponded = true;
          isResponseEmpty = responses.isEmpty;
          isLoading = false; // no longer loading since response has arrived
        });
      });
    });
  }

  _useCurrentLocationButtonHandler() async {
    // before location is retrieved, let user know app is loading
    setState(() {
      isLoading = true;
      isWaitingForLocation = true;
    });


    // using geolocation to retrieve user's current location

    Geolocator.checkPermission().then(
            (LocationPermission permission)
       async {
          print("Check Location Permission: $permission");
          print(await Geolocator.getLocationAccuracy() );
        }
    );

    Position userLocation = await Geolocator.getCurrentPosition();

    // no longer loading
    setState(() {
      isWaitingForLocation = false;
      isLoading = false;
    });

    final List<Placemark> places = await placemarkFromCoordinates(
        userLocation.latitude,
        userLocation.longitude
    );

    String address = '${places[0].street}, ${places[0].locality}, '
        '${places[0].administrativeArea} ${places[0].postalCode}, ${places[0].country}';
    // TODO : add it to user's info

    // replace textfield with the user's address
    textController.text = address;
  }
}

String baseUrl = 'https://api.mapbox.com/geocoding/v5/mapbox.places';
String accessToken = Constants.mapBoxAccessToken;
String searchType = 'place%2Cpostcode%2Caddress';
String searchResultsLimit = '5';
String proximity =
    '${Constants.warehouseLocation.longitude}%2C${Constants.warehouseLocation.latitude}';
String country = 'ca';

Dio _dio = Dio();

// using DIO to make HTTP requests to MapBox Search API
Future requestSearchResults(String query) async {
  String url =
      '$baseUrl/$query.json?country=$country&limit=$searchResultsLimit&proximity=$proximity&types=$searchType&access_token=$accessToken';
  url = Uri.parse(url).toString();
  print(url);
  try {
    _dio.options.contentType = Headers.jsonContentType;
    final responseData = await _dio.get(url);
    return responseData.data;
  } on DioError catch (e) {
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
    if (e.response != null) {
      print(e.response!.data);
      print(e.response!.headers);
      print(e.response!.requestOptions);
    } else {
      // Something happened in setting up or sending the request that triggered an Error
      print(e.requestOptions);
      print(e.message);
    }
  }
}


Future<List> getSearchResults(String query) async {
  List parsedResponses = [];

  // if the user has not entered anything, return empty list
  // trim() removes whitespaces
  if (query.trim() == '') return parsedResponses;

  // otherwise, request search results from MapBox Search API
  var response = await requestSearchResults(query);

  // filling list with results and returning it
  List features = response['features'];
  for (var feature in features) {
    Map response = {
      'name': feature['text'],
      'address': feature['place_name'].split('${feature['text']}, ')[1],
      'place': feature['place_name'],
      'location': LatLng(feature['center'][1], feature['center'][0])
    };
    parsedResponses.add(response);
  }
  return parsedResponses;
}