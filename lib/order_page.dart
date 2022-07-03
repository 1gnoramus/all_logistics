import 'package:flutter/material.dart';

class OrderType extends StatelessWidget {
  OrderType(this.colour, this.text);

  final Color colour;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: colour, borderRadius: BorderRadius.circular(10.0)),
      width: 280.0,
      height: 40.0,
      margin: EdgeInsets.all(10.0),
      child: Center(
        child: Text(text),
      ),
    );
  }
}
