import 'package:flutter/material.dart';
import '../constants.dart';

class OrderInfo extends StatelessWidget {
  OrderInfo(
    this.icon,
    this.placeFrom,
    this.placeTo,
    this.period,
    this.transp,
  );

  final IconData icon;
  final String period;
  final String placeFrom;
  final String placeTo;
  final String transp;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Container(
            height: 85.0,
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.blue,
            ),
            child: Icon(
              icon,
              size: 50.0,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          MainOrderInfo('МЕСТО ОТГРУЗКИ:', placeFrom),
                          SizedBox(
                            height: 10.0,
                          ),
                          MainOrderInfo('МЕСТО ВЫГРУЗКИ:', placeTo),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      children: [
                        MainOrderInfo('ВРЕМЯ ОТГРУЗКИ:', period),
                        SizedBox(
                          height: 10.0,
                        ),
                        MainOrderInfo('ТИП ТРАНСПОРТА:', transp),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainOrderInfo extends StatelessWidget {
  MainOrderInfo(
    this.title,
    this.mainData,
  );

  final String title;
  final String mainData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: Column(
        children: [
          Text(title, style: kOrderTitleTextStyle),
          Text(mainData, style: kOrderTitleTextStyle),
        ],
      ),
    );
  }
}
