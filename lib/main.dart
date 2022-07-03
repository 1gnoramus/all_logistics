import 'package:flutter/material.dart';
import 'order_page.dart';
import 'order_info.dart';

void main() => runApp(AllLogistics());

class AllLogistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: (Color(0xFFE9FB47)),
        ),
        scaffoldBackgroundColor: Color(0xFFE9FB47),
      ),
      home: OrderPage(),
    );
  }
}

class OrderPage extends StatefulWidget {
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          OrderType(Colors.red, 'Срочные'),
          OrderInfo(Icons.auto_awesome, 'МЕСТО ВЫГРУЗКИ', 'МЕСТО ОТГРУЗКИ',
              'ВРЕМЯ ОТГРУЗКИ', 'ТИП МАШИНЫ:'),
          OrderInfo(Icons.auto_awesome, 'МЕСТО ВЫГРУЗКИ', 'МЕСТО ОТГРУЗКИ',
              'ВРЕМЯ ОТГРУЗКИ', 'ТИП МАШИНЫ:'),
          SizedBox(
            width: 200.0,
          ),
          OrderType(Colors.green, 'Обычные'),
          OrderInfo(Icons.auto_awesome, 'МЕСТО ВЫГРУЗКИ', 'МЕСТО ОТГРУЗКИ',
              'ВРЕМЯ ОТГРУЗКИ', 'ТИП МАШИНЫ:'),
          OrderInfo(Icons.auto_awesome, 'МЕСТО ВЫГРУЗКИ', 'МЕСТО ОТГРУЗКИ',
              'ВРЕМЯ ОТГРУЗКИ', 'ТИП МАШИНЫ:'),
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.menu_book,
                  size: 50.0,
                  color: Colors.grey.shade800,
                ),
                Icon(
                  Icons.newspaper,
                  size: 50.0,
                  color: Colors.grey.shade800,
                ),
                Icon(
                  Icons.info,
                  size: 50.0,
                  color: Colors.grey.shade800,
                ),
                Icon(
                  Icons.history,
                  size: 50.0,
                  color: Colors.grey.shade800,
                ),
                Icon(
                  Icons.person,
                  size: 50.0,
                  color: Colors.grey.shade800,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
