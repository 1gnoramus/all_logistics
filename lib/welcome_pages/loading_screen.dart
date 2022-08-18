import 'package:all_log/main_pages/order_page.dart';
import 'package:all_log/services/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  static String id = 'loading_screen';
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude = 0.0;
  double longitude = 0.0;

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void getLocation() async {
    Location location = Location();
    latitude = location.latitude;
    longitude = location.longitude;

    await location.getCurrentLocation();
    print(latitude);
    print(longitude);

    Navigator.pushNamed(context, OrderPage.id);
  }

  @override
  Widget build(BuildContext context) {
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
