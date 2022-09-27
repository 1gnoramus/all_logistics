import 'package:all_log/welcome_pages/loading_screen.dart';
import 'package:all_log/welcome_pages/welcome_page.dart';
import 'new_order_page.dart';
import 'package:flutter/material.dart';
import '../components/order_info.dart';
import '../components/bottom_data.dart';
import 'package:all_log/components/order_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:all_log/components/order_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String uploadPlace = '';
String downloadPlace = '';
String uploadTime = '';
String transpType = '';

class OrderPage extends StatefulWidget {
  OrderPage({this.logOrder, this.locationInfo});
  static String id = 'order_page';
  final locationInfo;
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
  String countryName = 'Russ';

  NewOrderPage newOrderPage = NewOrderPage();
  LoadingScreen location = LoadingScreen();

  void updateLocation(dynamic locationData) {
    setState(() {
      if (locationData == null) {
        countryName = 'Unknown';
        return;
      }
      countryName = locationData[0].country.toString();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    updateLocation(Provider.of<OrderData>(context).userInfo);
int _currentIndex = 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavBar(),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        actions: [
          Center(
            child: Text(
              countryName,
              style: TextStyle(fontSize: 20.0, color: Colors.yellow),
            ),
          ),
          GestureDetector(
            child: Icon(Icons.location_on),
            onTap: () {},
          ),
          IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.pushNamed(context, WelcomePage.id);
            },
            icon: Icon(Icons.logout),
          ),
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
                'Срочные: (${Provider.of<OrderData>(context).urgOrderBoxes.length})',
              ),
              GestureDetector(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return NewOrderPage();
                      },
                    ),
                  );
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
                child: OrdersStream(
                  isUrgent: true,
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
                'Обычные : (${Provider.of<OrderData>(context).comOrderBoxes.length})',
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
                child: OrdersStream(
                  isUrgent: false,
                ),
              ),
            ),
          ),
          // FloatingActionButton(onPressed: floatBut),
        ],
      ),
    );
  }
}
// TODO: Добавить страницу заявки с возможность "Принять запрос" и "Связаться с ГП"
// TODO: Соединить страницу со страницей "История" через Provider. Передавать информацию о заявках
