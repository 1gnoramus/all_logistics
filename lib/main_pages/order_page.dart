import 'package:all_log/welcome_pages/welcome_page.dart';

import 'new_order_page.dart';
import 'package:flutter/material.dart';
import '../components/order_info.dart';
import '../components/bottom_data.dart';
import 'package:all_log/components/order_type.dart';
import 'package:firebase_auth/firebase_auth.dart';

String uploadPlace = '';
String downloadPlace = '';
String uploadTime = '';
String transpType = '';

class OrderPage extends StatefulWidget {
  static String id = 'order_page';
  OrderPage({this.logOrder});

  final logOrder;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _auth = FirebaseAuth.instance;
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
  }

  String uploadPlace = '';
  String downloadPlace = '';
  String uploadTime = '';
  String transpType = '';
  bool isUrgent = false;

  NewOrderPage newOrderPage = NewOrderPage();

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    updateInfo(widget.logOrder);
  }

  List<Widget> urgOrderKeeper = [];
  List<Widget> comOrderKeeper = [];

  void addOrderBlock(orderData) {
    if (orderData != null) {
      updateInfo(orderData);
      setState(() {
        if (isUrgent == true) {
          urgOrderKeeper.add(
            OrderInfo(Icons.auto_awesome, uploadPlace, downloadPlace,
                uploadTime, transpType),
          );
        } else {
          comOrderKeeper.add(
            OrderInfo(Icons.auto_awesome, uploadPlace, downloadPlace,
                uploadTime, transpType),
          );
        }
      });
    }
  }

  void updateInfo(dynamic orderData) {
    setState(
      () {
        if (orderData == null) {
          uploadPlace = 'None';
          downloadPlace = 'None';
          uploadTime = 'None';
          transpType = 'None';
          isUrgent = false;
        } else {
          uploadPlace = orderData['uploadPlace'];
          downloadPlace = orderData['downloadPlace'];
          uploadTime = orderData['uploadTime'];
          transpType = orderData['transType'];
          isUrgent = orderData['isUrgent'];
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pushNamed(context, WelcomePage.id);
              },
              icon: Icon(Icons.logout))
        ],
        title: Text('Order Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Row(
            children: [
              OrderType(
                Colors.red,
                'Срочные',
              ),
              GestureDetector(
                onTap: () async {
                  var typedData = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return NewOrderPage();
                      },
                    ),
                  );
                  if (typedData != null) {
                    addOrderBlock(typedData);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  width: 40.0,
                  height: 40.0,
                  margin: EdgeInsets.all(10.0),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Material(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                elevation: 5.0,
                child: ListView.builder(
                  itemCount: urgOrderKeeper.length,
                  itemBuilder: (BuildContext context, int index) {
                    return urgOrderKeeper[index];
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            width: 200.0,
          ),
          Row(
            children: [
              OrderType(
                Colors.green,
                'Обычные',
              ),
              GestureDetector(
                onTap: () async {
                  var typedData = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return NewOrderPage();
                      },
                    ),
                  );
                  if (typedData != null) {
                    updateInfo(typedData);
                    addOrderBlock(typedData);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  width: 40.0,
                  height: 40.0,
                  margin: EdgeInsets.all(10.0),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Material(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                elevation: 5.0,
                child: ListView.builder(
                  itemCount: comOrderKeeper.length,
                  itemBuilder: (BuildContext context, int index) {
                    return comOrderKeeper[index];
                  },
                ),
              ),
            ),
          ),
          BottomPanelWidget(),
          // FloatingActionButton(onPressed: floatBut),
        ],
      ),
    );
  }
}
