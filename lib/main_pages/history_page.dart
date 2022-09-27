import 'package:flutter/material.dart';
import 'package:all_log/welcome_pages/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:all_log/components/bottom_data.dart';
import 'package:all_log/components/inProc_historyStream.dart';
import 'package:all_log/components/accepted_historyStream.dart';
import 'package:all_log/components/rejected_historyStream.dart';
import 'package:provider/provider.dart';
import 'package:all_log/components/order_data.dart';

final _auth = FirebaseAuth.instance;
late User loggedinUser;

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
              child: status == '0'
                  ? AcceptedHistoryStream()
                  : status == '1'
                      ? HistoryStream()
                      : RejectedHistoryStream(),
            )
          ],
        ),
      ),
    );
  }
}
