import 'package:flutter/material.dart';
import 'order_info.dart';
import 'bottom_data.dart';
import 'order_type.dart';

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
          OrderInfo(Icons.auto_awesome, 'Костанай', 'Алматы', '22:00',
              'РефКонтейнер'),
          OrderInfo(Icons.auto_awesome, '-', '-', '-', '-'),
          SizedBox(
            width: 200.0,
          ),
          OrderType(Colors.green, 'Обычные'),
          OrderInfo(
              Icons.auto_awesome, 'Бишкек', 'Пекин', '20:00', '20-футТрак'),
          OrderInfo(Icons.auto_awesome, 'Усть-Каменогорск', 'Нурсултан',
              '19:00', 'Газель'),
          BottomPanelWidget(),
        ],
      ),
    );
  }
}
