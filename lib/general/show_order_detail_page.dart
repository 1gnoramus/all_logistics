import 'package:all_log/components/colourful_button.dart';
import 'package:all_log/logistician/log_history_page.dart';
import 'package:all_log/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

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
    this.orderId,
    required this.orderStatus,
  });

  final int orderNum;
  final String userName;
  final IconData icon;
  final String uploadTime;
  final String uploadPlace;
  final String downloadPlace;
  final String transType;
  String? orderId;
  final String orderStatus;

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
                    "Место отгрузки: $uploadPlace \nМесто выгрузки: $downloadPlace \nВремя отгрузки: $uploadTime \nТип транспорта: $transType \nСрочный: $orderStatus",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                  ),
                ],
              ),
            ),
            ColourfulButton(
              buttonColor: Colors.lightBlueAccent,
              onTap: () async {
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
                _firestore
                    .collection('inProcessingOrders')
                    .doc(documentId)
                    .update({'orderId': documentId});
                print(documentId);
                Navigator.pop(context);
              },
              buttonText: 'Отозваться на заявку',
            ),
            ColourfulButton(
              buttonColor: Colors.lightGreenAccent,
              onTap: () async {
                var resp =
                    await Provider.of<AppStateManager>(context, listen: false)
                        .changeOrderStatus_InProc(orderId);
              },
              buttonText: 'Связаться с грузополучателем',
            ),
            ColourfulButton(
              buttonColor: Colors.redAccent,
              onTap: () {
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
              buttonText: 'Отменить запрос',
            ),
          ],
        ),
      ),
    );
  }
}
