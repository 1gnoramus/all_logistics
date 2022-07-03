import 'package:flutter/material.dart';

const kLabelTextStyle =
    TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.black);

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
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: 40.0,
                          child: Text(placeFrom, style: kLabelTextStyle),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 40.0,
                          child: Text(placeTo, style: kLabelTextStyle),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 40.0,
                        child: Text(period, style: kLabelTextStyle),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 40.0,
                        child: Text(transp, style: kLabelTextStyle),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
