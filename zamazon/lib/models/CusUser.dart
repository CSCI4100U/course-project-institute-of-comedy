import 'package:cloud_firestore/cloud_firestore.dart';

// class for managing and manipulating the user's personal information.

class CusUser {
  DocumentReference? docRef;
  String? name;
  String? email;
  String? country;
  String? province;
  String? city;
  String? postal;

  // Only for the streambuilder to have initialdata while the stream initializes
  CusUser({
    this.name = 'Default',
    this.email = 'default@default.com',
    this.country = 'defaultia',
    this.province = 'defaulto',
    this.city = 'defaultville',
    this.postal = 'A1B 2C3',
  });

  CusUser.fromMap(var map, {this.docRef}) {
    this.name = map['name'];
    this.email = map['email'];
    this.country = map['country'];
    this.province = map['province'];
    this.city = map['city'];
    this.postal = map['postal'];
  }

  Map<String, Object?> toMap() {
    return {
      'name': this.name,
      'email': this.email,
      'country': this.country,
      'province': this.province,
      'city': this.city,
      'postal': this.postal,
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return '$name, $email, $country, $province, $city, $postal';
  }
}
