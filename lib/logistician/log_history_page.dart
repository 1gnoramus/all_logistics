import 'package:flutter/material.dart';
import 'package:all_log/welcome_pages/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:all_log/driver/driver_main.dart';
import 'package:all_log/components/inProc_historyStream.dart';
import 'package:all_log/components/accepted_historyStream.dart';
import 'package:all_log/components/rejected_historyStream.dart';
import 'package:provider/provider.dart';
import 'package:all_log/components/order_data.dart';
import 'package:all_log/state/orders_provider.dart';

import '../state/app_state.dart';

final _auth = FirebaseAuth.instance;
late User loggedinUser;

class HistoryPage extends StatefulWidget {
  static String id = 'history_page';

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    getOrders;
    super.initState();
  }

  void getOrders() async {
    await Provider.of<AppStateManager>(context, listen: false)
        .getDriverOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          actions: [
            IconButton(
              onPressed: () async {},
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
        body: Consumer<AppStateManager>(builder: (BuildContext context,
            AppStateManager appStateManager, Widget? child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: HistoryPiece(
                        title: "Принятые в работу",
                        titleColor: Colors.green.shade800,
                        child: Expanded(
                          child: ListView.builder(
                            itemCount: appStateManager.orders!.length,
                            itemBuilder: (BuildContext context, int index) {
                              if (appStateManager.orders![index].orderStatus ==
                                  'accepted') {
                                return AcceptedHistory(
                                    custUserName:
                                        appStateManager.orders![index].username,
                                    uploadPlace: appStateManager
                                        .orders![index].uploadPlace,
                                    downloadPlace: appStateManager
                                        .orders![index].downloadPlace,
                                    uploadTime: appStateManager
                                        .orders![index].uploadTime,
                                    transType: appStateManager
                                        .orders![index].transType,
                                    orderNum: appStateManager
                                        .orders![index].orderNum
                                        .toString(),
                                    orderId:
                                        appStateManager.orders![index].orderId,
                                    status: appStateManager
                                        .orders![index].orderStatus,
                                    color: Colors.green);
                              }
                              return Container();
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: HistoryPiece(
                        title: 'В обработке',
                        titleColor: Colors.orange.shade800,
                        child: Expanded(
                          child: ListView.builder(
                            itemCount: appStateManager.orders!.length,
                            itemBuilder: (BuildContext context, int index) {
                              if (appStateManager.orders![index].orderStatus ==
                                  'inProcess') {
                                return InProcHistory(
                                    custUserName:
                                        appStateManager.orders![index].username,
                                    uploadPlace: appStateManager
                                        .orders![index].uploadPlace,
                                    downloadPlace: appStateManager
                                        .orders![index].downloadPlace,
                                    uploadTime: appStateManager
                                        .orders![index].uploadTime,
                                    transType: appStateManager
                                        .orders![index].transType,
                                    orderNum: appStateManager
                                        .orders![index].orderNum
                                        .toString(),
                                    orderId:
                                        appStateManager.orders![index].orderId,
                                    status: appStateManager
                                        .orders![index].orderStatus,
                                    color: Colors.orange);
                              }
                              return Container();
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: HistoryPiece(
                        title: 'Отмененные',
                        titleColor: Colors.red.shade800,
                        child: Expanded(
                          child: ListView.builder(
                            itemCount: appStateManager.orders!.length,
                            itemBuilder: (BuildContext context, int index) {
                              if (appStateManager.orders![index].orderStatus ==
                                  'rejected') {
                                return RejectedHistory(
                                    custUserName:
                                        appStateManager.orders![index].username,
                                    uploadPlace: appStateManager
                                        .orders![index].uploadPlace,
                                    downloadPlace: appStateManager
                                        .orders![index].downloadPlace,
                                    uploadTime: appStateManager
                                        .orders![index].uploadTime,
                                    transType: appStateManager
                                        .orders![index].transType,
                                    orderNum: appStateManager
                                        .orders![index].orderNum
                                        .toString(),
                                    orderId:
                                        appStateManager.orders![index].orderId,
                                    status: appStateManager
                                        .orders![index].orderStatus,
                                    color: Colors.red);
                              }
                              return Container();
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }));
  }
}

class HistoryPiece extends StatelessWidget {
  HistoryPiece(
      {required this.title, required this.titleColor, required this.child});

  final String title;
  final Color titleColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          child
        ],
      ),
    );
  }
}
