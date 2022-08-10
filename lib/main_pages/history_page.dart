import 'package:flutter/material.dart';
import 'package:all_log/welcome_pages/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:all_log/components/bottom_data.dart';
import 'package:all_log/components/constants.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:all_log/components/order_data.dart';

final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;

class HistoryPage extends StatefulWidget {
  static String id = 'history_page';

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
                  title: 'Обрабатывается (0)',
                  titleColor: Colors.orange,
                  histColor: Colors.orangeAccent,
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
      required this.titleColor,
      required this.histColor,
      required this.statusText});
  final String title;
  final Color titleColor;
  final Color histColor;

  final String statusText;

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
              child: HistoryStream(),
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
  });

  final String custUserName;
  final String orderNum;
  final String uploadTime;
  final String uploadPlace;
  final String downloadPlace;
  final String transType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: Material(
          elevation: 7.0,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.red,
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
                ))
            .toList();

        Provider.of<OrderData>(context).histBoxesList = histories!;

        return ListView.builder(
          itemCount: Provider.of<OrderData>(context).histBoxesList.length,
          itemBuilder: (BuildContext context, int index) {
            return Provider.of<OrderData>(context).histBoxesList[index];
          },
        );
      },
    );
  }
}
