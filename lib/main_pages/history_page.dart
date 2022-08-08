import 'package:flutter/material.dart';
import 'package:all_log/welcome_pages/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:all_log/components/bottom_data.dart';
import 'package:all_log/components/constants.dart';

class HistoryPage extends StatefulWidget {
  static String id = 'history_page';

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final _auth = FirebaseAuth.instance;

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
              children: [
                HistoryPiece(
                  title: 'Выполненные заказы (0)',
                  titleColor: Colors.green,
                  histColor: Colors.greenAccent,
                  statusText: 'Выполнен',
                ),
                HistoryPiece(
                  title: 'Обрабатывается (0)',
                  titleColor: Colors.orange,
                  histColor: Colors.orangeAccent,
                  statusText: 'Обрабатывается',
                ),
                HistoryPiece(
                  title: 'Отмененные заказы (0)',
                  titleColor: Colors.red,
                  histColor: Colors.redAccent,
                  statusText: 'Отменен',
                ),
              ],
            ),
          ),
          BottomPanelWidget()
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
    List<History> histBoxesList = [
      History(
        histColor: histColor,
        statusText: statusText,
      ),
      History(
        histColor: histColor,
        statusText: statusText,
      ),
      History(
        histColor: histColor,
        statusText: statusText,
      ),
      History(
        histColor: histColor,
        statusText: statusText,
      ),
    ];

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
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return histBoxesList[index];
                },
                itemCount: histBoxesList.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class History extends StatelessWidget {
  History({required this.histColor, required this.statusText});

  final Color histColor;
  final String statusText;

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
              color: histColor,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Заказ Номер 337',
                    style: kBottomPanelTextStyle,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Статус: $statusText'),
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
