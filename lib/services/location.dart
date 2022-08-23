import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class Location {
  double latitude = 0.0;
  double longitude = 0.0;
  String? countryName;

  Future<void> getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      longitude = position.longitude;
      latitude = position.latitude;

      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      print(placemarks[0].country);
      countryName = placemarks[0].country.toString();
    } catch (e) {
      print(e);
    }
  }
}
