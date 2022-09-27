import 'package:all_log/components/bottom_data.dart';
import 'package:all_log/main_pages/order_page.dart';
import 'package:all_log/services/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:geocoding/geocoding.dart';
import 'package:all_log/components/order_data.dart';

class LoadingScreen extends StatefulWidget {
  static String id = 'loading_screen';
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String countryName = 'asd';
  String cityName = 'dsa';
  double latitude = 0.0;
  double longitude = 0.0;

  void getLocation() async {
    try {
      UserLocation location = UserLocation();
      await location.getCurrentLocation();
      latitude = location.latitude;
      longitude = location.longitude;

      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      Provider.of<OrderData>(context, listen: false).userInfo = placemarks;
      countryName = placemarks[0].country.toString();
      cityName = placemarks[0].locality.toString();
    } catch (e) {
      print(e);
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return BottomNavBar();
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getLocation();

    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.red,
          size: 100.0,
        ),
      ),
    );
  }
}
