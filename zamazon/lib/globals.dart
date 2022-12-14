import 'package:mapbox_gl/mapbox_gl.dart';

const zamazonLogo = 'https://imgur.com/nhjEvGz.png';
final languages = ['en', 'fr', 'sp', 'cn', 'jp'];

class Constants {
  static const String mapBoxAccessToken =
      'pk.eyJ1IjoiZ293dGhhbXJhamVuZHJhMjciLCJhIjoiY2xhMzBkbmx5MDRzaTNvcnhjbm9nb24xNCJ9.hjfzhRWwIyOOUYSGVpS79Q';
  static const String mapBoxStyleId =
      'https://api.mapbox.com/styles/v1/gowthamrajendra27/clazzghty004t17p8sxx0t2em/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZ293dGhhbXJhamVuZHJhMjciLCJhIjoiY2xhMzBkbmx5MDRzaTNvcnhjbm9nb24xNCJ9.hjfzhRWwIyOOUYSGVpS79Q';

  static const warehouseLocation = LatLng(43.9464307188495, -78.8971513804269);
}

// secret token map box
// sk.eyJ1IjoiZ293dGhhbXJhamVuZHJhMjciLCJhIjoiY2xiYTU0OXcwMDduNzNwczhtM2xtbHFvaiJ9.xKKLGFkyKThEaglPcAduhA