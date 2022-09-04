import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:all_log/components/order_data.dart';
import 'package:all_log/components/history_rapid_data_block.dart';
import 'package:all_log/components/colourful_button.dart';

final _auth = FirebaseAuth.instance;

final _firestore = FirebaseFirestore.instance;
late User loggedinUser;

class RejectedHistoryStream extends StatelessWidget {
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    getCurrentUser();
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('rejectedOrders').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.redAccent,
            ),
          );
        }

        final histories = snapshot.data?.docs
            .map((history) => RejectedHistory(
                  custUserName:
                      history.data().toString().contains('customerUsername')
                          ? history.get('customerUsername')
                          : '',
                  uploadPlace: history.data().toString().contains('uploadPlace')
                      ? history.get('uploadPlace')
                      : '',
                  downloadPlace:
                      history.data().toString().contains('downloadPlace')
                          ? history.get('downloadPlace')
                          : '',
                  uploadTime: history.data().toString().contains('uploadTime')
                      ? history.get('uploadTime')
                      : '',
                  transType: history.data().toString().contains('transType')
                      ? history.get('transType')
                      : '',
                  orderNum: history.data().toString().contains('number')
                      ? history.get('number').toString()
                      : '',
                  status: '',
                  orderId: history.data().toString().contains('orderId')
                      ? history.get('orderId').toString()
                      : '',
                  color: Colors.redAccent,
                ))
            .toList();

        Provider.of<OrderData>(context).rejectedHistList = histories!;

        return ListView.builder(
          itemCount: Provider.of<OrderData>(context).rejectedHistList.length,
          itemBuilder: (BuildContext context, int index) {
            return Provider.of<OrderData>(context).rejectedHistList[index];
          },
        );
      },
    );
  }
}

class RejectedHistory extends StatelessWidget {
  RejectedHistory({
    required this.custUserName,
    required this.uploadPlace,
    required this.downloadPlace,
    required this.uploadTime,
    required this.transType,
    required this.orderNum,
    required this.orderId,
    required this.status,
    required this.color,
  });

  final String custUserName;
  final String orderNum;
  final String orderId;
  final String uploadTime;
  final String uploadPlace;
  final String downloadPlace;
  final String transType;
  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  color: Color(0xff757575),
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Заявка № $orderNum",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 20.0, color: Colors.black54),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(
                                  Icons.abc,
                                  size: 100.0,
                                  color: Colors.red,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Text(
                                "Место отгрузки: $uploadPlace \nМесто выгрузки: $downloadPlace \nВремя отгрузки: $uploadTime \nТип транспорта: $transType",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        ColourfulButton(
                            buttonColor: Colors.redAccent,
                            onTap: () async {
                              _firestore
                                  .collection('rejectedOrders')
                                  .doc(orderId.toString())
                                  .delete()
                                  .then(
                                    (doc) => print("Document deleted"),
                                    onError: (e) =>
                                        print("Error updating document $e"),
                                  );
                              Navigator.pop(context);
                            },
                            buttonText: 'Удалить запрос')
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        child: HistRapidData(
            orderNum: orderNum, custUserName: custUserName, color: color));
  }
}
