import 'package:flutter/material.dart';
import 'package:all_log/welcome_pages/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:all_log/components/bottom_data.dart';
import 'package:all_log/components/constants.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:all_log/components/order_data.dart';
import 'show_order_detail_page.dart';
import 'dart:convert';

final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;

class HistoryPage extends StatefulWidget {
  static String id = 'history_page';
  String status = '';

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.pushNamed(context, WelcomePage.id);
            },
            icon: Icon(Icons.logout),
          ),
        ],
        title: Text('History Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HistoryPiece(
                  status: '0',
                  title: 'Приняты в работу:',
                  titleColor: Colors.green,
                  statusText: 'Обрабатывается',
                ),
                HistoryPiece(
                  status: '1',
                  title:
                      'Обрабатывается : (${Provider.of<OrderData>(context).inProcHistList.length})',
                  titleColor: Colors.orange,
                  statusText: 'Обрабатывается',
                ),
                HistoryPiece(
                  status: '2',
                  title: 'Отмененные',
                  titleColor: Colors.red.shade700,
                  statusText: 'Обрабатывается',
                ),
              ],
            ),
          ),
          BottomPanelWidget('History')
        ],
      ),
    );
  }
}

class HistoryPiece extends StatelessWidget {
  HistoryPiece(
      {required this.title,
      required this.status,
      required this.titleColor,
      required this.statusText});
  final String title;
  final Color titleColor;
  final String statusText;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 5.0),
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: titleColor,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Text(title),
            ),
            Expanded(
              child: HistoryStream(status),
            )
          ],
        ),
      ),
    );
  }
}

class History extends StatelessWidget {
  History({
    required this.custUserName,
    required this.uploadPlace,
    required this.downloadPlace,
    required this.uploadTime,
    required this.transType,
    required this.orderNum,
    required this.status,
  });

  final String custUserName;
  final String orderNum;
  final String uploadTime;
  final String uploadPlace;
  final String downloadPlace;
  final String transType;
  final String status;

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
                        style: TextStyle(fontSize: 20.0, color: Colors.black54),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
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
                      FlatButton(
                        color: Colors.lightGreenAccent,
                        onPressed: () async {
                          print(status);
                        },
                        child: Text(
                          'Принять запрос',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      FlatButton(
                        color: Colors.redAccent,
                        onPressed: () async {},
                        child: Text(
                          'Отклонить запрос',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: Material(
          elevation: 7.0,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: status == '0'
                  ? Colors.lightGreen
                  : status == '1'
                      ? Colors.orangeAccent
                      : status == '2'
                          ? Colors.redAccent
                          : Colors.blue,
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
      ),
    );
  }
}

class HistoryStream extends StatelessWidget {
  HistoryStream(this.status);
  final String status;
  List currentHistList = [];
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('inProcessingOrders').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.redAccent,
            ),
          );
        }

        final histories = snapshot.data?.docs
            .map((history) => History(
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
                  status: status,
                ))
            .toList();

        Provider.of<OrderData>(context).inProcHistList = histories!;

        return ListView.builder(
          itemCount: Provider.of<OrderData>(context).inProcHistList.length,
          itemBuilder: (BuildContext context, int index) {
            return Provider.of<OrderData>(context).inProcHistList[index];
          },
        );
      },
    );
  }
}
