import 'package:all_log/welcome_pages/loading_screen.dart';
import 'package:all_log/welcome_pages/welcome_page.dart';
import '../general/new_order_page.dart';
import 'package:flutter/material.dart';
import '../state/app_state.dart';
import 'driver_order_info.dart';
import 'driver_main.dart';
import 'package:all_log/components/order_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:all_log/components/order_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:all_log/state/orders_provider.dart';

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
  @override
  void initState() {
    super.initState();
    getOrders();
  }

  void getOrders() async {
    await Provider.of<AppStateManager>(context, listen: false)
        .getDriverOrders();
  }

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
  Widget build(BuildContext context) {
    updateLocation(Provider.of<OrderData>(context).userInfo);
    int _currentIndex = 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
              child: Column(
                children: [
                  const Text(
                    'userName    ',
                    style: TextStyle(fontSize: 12.0, color: Colors.black54),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              MainOrderInfo('МЕСТО ОТГРУЗКИ:', uploadPlace),
                              const SizedBox(
                                height: 10.0,
                              ),
                              MainOrderInfo('МЕСТО ВЫГРУЗКИ:', downloadPlace),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 60.0,
                        ),
                        Container(
                          child: Column(
                            children: [
                              MainOrderInfo('ВРЕМЯ ОТГРУЗКИ:', uploadPlace),
                              SizedBox(
                                height: 10.0,
                              ),
                              MainOrderInfo('ТИП ТРАНСПОРТА:', uploadPlace),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
          // FloatingActionButton(onPressed: floatBut),
        ],
      ),
    );
  }
}
// TODO: Добавить страницу заявки с возможность "Принять запрос" и "Связаться с ГП"
// TODO: Соединить страницу со страницей "История" через Provider. Передавать информацию о заявках
