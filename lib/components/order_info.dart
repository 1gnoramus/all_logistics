import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:all_log/main_pages/show_order_detail_page.dart';
import 'package:all_log/components/order_data.dart';

final _auth = FirebaseAuth.instance;

final _firestore = FirebaseFirestore.instance;

class OrderBox extends StatelessWidget {
  OrderBox(
      {required this.userName,
      required this.icon,
      required this.uploadPlace,
      required this.downloadPlace,
      required this.uploadTime,
      required this.transType,
      required this.orderNum,
      required this.orderStatus,
      required this.orderId});

  final String userName;
  final int orderNum;

  final IconData icon;
  final String uploadTime;
  final String uploadPlace;
  final String downloadPlace;
  final String transType;
  final String orderStatus;
  final String orderId;

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
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: ShowOrderDetailPage(
                          orderId: orderId,
                          uploadPlace: uploadPlace,
                          downloadPlace: downloadPlace,
                          uploadTime: uploadTime,
                          transType: transType,
                          userName: userName,
                          icon: icon,
                          orderNum: orderNum,
                        ),
                      ),
                    ),
                  );
                },
                child: Material(
                  borderRadius: BorderRadius.circular(15.0),
                  elevation: 10.0,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '$userName    ',
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
                                  MainOrderInfo(
                                      'МЕСТО ВЫГРУЗКИ:', downloadPlace),
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
      stream: _firestore.collection('Orders').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.lightBlueAccent,
            ),
          );
        }
        final urgOrders = snapshot.data?.docs.map(
          (order) {
            if (order.get('isUrgent')) {
              return OrderBox(
                userName: order.data().toString().contains('username')
                    ? order.get('username')
                    : '',
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
                orderNum: order.data().toString().contains('orderNum')
                    ? order.get('orderNum')
                    : '',
                orderStatus: 'InProcess',
                orderId: order.data().toString().contains('orderId')
                    ? order.get('orderId')
                    : '',
              );
            }
          },
        ).toList();
        urgOrders!.removeWhere((element) => element == null);

        Provider.of<OrderData>(context).urgOrderBoxes = urgOrders;

        final comOrders = snapshot.data?.docs.map(
          (order) {
            if (order.get('isUrgent') == false) {
              return OrderBox(
                userName: order.data().toString().contains('username')
                    ? order.get('username')
                    : '',
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
                orderNum: order.data().toString().contains('orderNum')
                    ? order.get('orderNum')
                    : '',
                orderStatus: 'InProcess',
                orderId: order.data().toString().contains('orderId')
                    ? order.get('orderId')
                    : '',
              );
            }
          },
        ).toList();
        comOrders!.removeWhere((element) => element == null);
        Provider.of<OrderData>(context).comOrderBoxes = comOrders;

        if (isUrgent) {
          return ListView.builder(
            itemCount: Provider.of<OrderData>(context).urgOrderBoxes.length,
            itemBuilder: (BuildContext context, int index) {
              return Provider.of<OrderData>(context).urgOrderBoxes[index];
            },
          );
        } else {
          return ListView.builder(
            itemCount: Provider.of<OrderData>(context).comOrderBoxes.length,
            itemBuilder: (BuildContext context, int index) {
              return Provider.of<OrderData>(context).comOrderBoxes[index];
            },
          );
        }
      },
    );
  }
}
