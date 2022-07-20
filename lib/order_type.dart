import 'new_order_page.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'order_page.dart';

class OrderType extends StatefulWidget {
  OrderType(this.colour, this.text);

  final Color colour;
  final String text;

  @override
  State<OrderType> createState() => _OrderTypeState();
}

class _OrderTypeState extends State<OrderType> {
  OrderPage orderPage = OrderPage();
  NewOrderPage newOrderPage = NewOrderPage();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.colour, borderRadius: BorderRadius.circular(10.0)),
      width: 280.0,
      height: 40.0,
      margin: EdgeInsets.all(10.0),
      child: Center(
        child: Text(widget.text),
      ),
    );
  }
}
