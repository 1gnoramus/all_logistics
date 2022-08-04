import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;

final _firestore = FirebaseFirestore.instance;

class OrderBox extends StatelessWidget {
  OrderBox({
    required this.icon,
    required this.uploadPlace,
    required this.downloadPlace,
    required this.uploadTime,
    required this.transType,
  });

  final IconData icon;
  final String uploadTime;
  final String uploadPlace;
  final String downloadPlace;
  final String transType;

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
              child: Material(
                borderRadius: BorderRadius.circular(15.0),
                elevation: 5.0,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${_auth.currentUser?.email}    ',
                      style: TextStyle(fontSize: 12.0, color: Colors.black54),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                MainOrderInfo('МЕСТО ОТГРУЗКИ:', uploadPlace),
                                SizedBox(
                                  height: 10.0,
                                ),
                                MainOrderInfo('МЕСТО ВЫГРУЗКИ:', downloadPlace),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            children: [
                              MainOrderInfo('ВРЕМЯ ОТГРУЗКИ:', uploadTime),
                              SizedBox(
                                height: 10.0,
                              ),
                              MainOrderInfo('ТИП ТРАНСПОРТА:', transType),
                            ],
                          )
                        ],
                      ),
                    ),
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
      child: Column(
        children: [
          Text(title, style: kOrderTitleTextStyle),
          Text(mainData, style: kOrderTitleTextStyle),
        ],
      ),
    );
  }
}

class OrdersStream extends StatelessWidget {
  OrdersStream({required this.isUrgent});

  final bool isUrgent;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('orders').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.lightBlueAccent,
            ),
          );
        }
        final orders = snapshot.data?.docs;
        List<OrderBox> urgOrderBoxes = [];
        List<OrderBox> comOrderBoxes = [];

        for (var order in orders!) {
          if (order.get('isUrgent') == true) {
            final orderBox = OrderBox(
              icon: Icons.stacked_line_chart_outlined,
              uploadPlace: order.data().toString().contains('uploadPlace')
                  ? order.get('uploadPlace')
                  : '',
              downloadPlace: order.data().toString().contains('downloadPlace')
                  ? order.get('downloadPlace')
                  : '',
              uploadTime: order.data().toString().contains('uploadTime')
                  ? order.get('uploadTime')
                  : '',
              transType: order.data().toString().contains('transType')
                  ? order.get('transType')
                  : '',
            );
            urgOrderBoxes.add(orderBox);
          } else if (order.get('isUrgent') == false) {
            final orderBox = OrderBox(
              icon: Icons.stacked_line_chart_outlined,
              uploadPlace: order.data().toString().contains('uploadPlace')
                  ? order.get('uploadPlace')
                  : '',
              downloadPlace: order.data().toString().contains('downloadPlace')
                  ? order.get('downloadPlace')
                  : '',
              uploadTime: order.data().toString().contains('uploadTime')
                  ? order.get('uploadTime')
                  : '',
              transType: order.data().toString().contains('transType')
                  ? order.get('transType')
                  : '',
            );
            comOrderBoxes.add(orderBox);
          }
        }
        if (isUrgent) {
          return ListView.builder(
              reverse: true,
              itemCount: urgOrderBoxes.length,
              itemBuilder: (BuildContext context, int index) {
                return urgOrderBoxes[index];
              });
        } else {
          return ListView.builder(
              reverse: true,
              itemCount: comOrderBoxes.length,
              itemBuilder: (BuildContext context, int index) {
                return comOrderBoxes[index];
              });
        }
      },
    );
  }
}
