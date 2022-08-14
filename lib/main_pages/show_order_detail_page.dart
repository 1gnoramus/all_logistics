import 'package:all_log/main_pages/history_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;

class ShowOrderDetailPage extends StatelessWidget {
  late User loggedinUser;

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

  ShowOrderDetailPage({
    required this.userName,
    required this.icon,
    required this.uploadPlace,
    required this.downloadPlace,
    required this.uploadTime,
    required this.transType,
    required this.orderNum,
    required this.orderId,
  });

  final int orderNum;
  final String userName;
  final IconData icon;
  final String uploadTime;
  final String uploadPlace;
  final String downloadPlace;
  final String transType;
  final String orderId;

  @override
  Widget build(BuildContext context) {
    getCurrentUser();
    return Container(
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
              style: TextStyle(fontSize: 20.0, color: Colors.black54),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Icon(
                      icon,
                      size: 100.0,
                      color: Colors.red,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    "Место отгрузки: $uploadPlace \nМесто выгрузки: $downloadPlace \nВремя отгрузки: $uploadTime \nТип транспорта: $transType",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                  ),
                ],
              ),
            ),
            FlatButton(
              color: Colors.lightBlueAccent,
              onPressed: () async {
                var docRef =
                    await _firestore.collection('inProcessingOrders').add({
                  'downloadPlace': downloadPlace,
                  'uploadPlace': uploadPlace,
                  'uploadTime': uploadTime,
                  'transType': transType,
                  'customerUsername': userName,
                  'executorUsername': loggedinUser.email,
                  'number': orderNum,
                  'orderId': orderId,
                });
                var documentId = docRef.id;
                print(documentId);
                Navigator.pushNamed(context, HistoryPage.id);
              },
              child: Text(
                'Отозваться на заявку',
                style: TextStyle(color: Colors.black54),
              ),
            ),
            FlatButton(
              color: Colors.lightGreenAccent,
              onPressed: () async {
                var collection = _firestore.collection('Orders');
                var querySnapshots = await collection.get();
                for (var snapshots in querySnapshots.docs) {
                  var documentID = snapshots.id;
                  print(documentID);
// <-- Document ID
                }
              },
              child: Text(
                'Связаться с грузополучателем',
                style: TextStyle(color: Colors.black54),
              ),
            ),
            FlatButton(
              color: Colors.redAccent,
              onPressed: () {
                print(orderId);
                _firestore
                    .collection('Orders')
                    .doc(orderId.toString())
                    .delete()
                    .then(
                      (doc) => print("Document deleted"),
                      onError: (e) => print("Error updating document $e"),
                    );
                Navigator.pop(context);
              },
              child: Text(
                'Отменить запрос',
                style: TextStyle(color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
