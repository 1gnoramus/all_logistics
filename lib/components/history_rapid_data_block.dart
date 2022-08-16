import 'package:flutter/material.dart';
import 'constants.dart';

class HistRapidData extends StatelessWidget {
  HistRapidData(
      {required this.orderNum,
      required this.custUserName,
      required this.color});

  final String orderNum;
  final String custUserName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Material(
        elevation: 7.0,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Заказ Номер $orderNum',
                  style: kBottomPanelTextStyle,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Заказ: $custUserName'),
                  Text('Дата: 19.02.2001'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
