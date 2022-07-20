import 'package:flutter/material.dart';
import 'order_page.dart';

void main() => runApp(AllLogistics());

class AllLogistics extends StatelessWidget {
  var logOrderData = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: (Color(0xFFE9FB47)),
        ),
        scaffoldBackgroundColor: Color(0xFFE9FB47),
      ),
      home: OrderPage(logOrder: logOrderData),
    );
  }
}
