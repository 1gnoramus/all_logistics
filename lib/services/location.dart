import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class Location {
  double latitude = 0.0;
  double longitude = 0.0;

  Future<void> getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      longitude = position.longitude;
      latitude = position.latitude;
      print('latitude: $latitude');
      print('longitude: $longitude');

      List<Placemark> placemarks =
          await placemarkFromCoordinates(52.2165157, 6.9437819);
      print('City: ${placemarks[0]}');
    } catch (e) {
      print(e);
    }
  }
}
