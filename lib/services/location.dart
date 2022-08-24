import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;
late User loggedinUser;

class Location {
  double latitude = 0.0;
  double longitude = 0.0;
  String countryName = 'asd';
  String cityName = 'dsa';

  Future<dynamic> getLocationInfo() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    print(placemarks[0].country);
    countryName = placemarks[0].country.toString();
    cityName = placemarks[0].locality.toString();
    print(cityName);
    _firestore.collection('usersInfo').add({
      'countryName': countryName,
      'cityName': cityName,
      'email': _auth.currentUser!.email.toString()
    });

    return countryName;
    return cityName;
  }

  Future<dynamic> getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
