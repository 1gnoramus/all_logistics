import 'package:flutter/material.dart';
import 'package:all_log/components/bottom_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewOrderPage extends StatefulWidget {
  const NewOrderPage({Key? key}) : super(key: key);

  @override
  State<NewOrderPage> createState() => _NewOrderPageState();
}

class _NewOrderPageState extends State<NewOrderPage> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
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

  void ordersStream() async {
    await for (var snapshot in _firestore.collection('orders').snapshots()) {
      for (var order in snapshot.docs) {}
    }
  }

  String uploadPlace = 'None';
  String downloadPlace = 'None';
  String uploadTime = 'None';
  String transType = 'None';
  bool isUrgent = false;

  Map<String, dynamic> inputData = {};

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('New Order Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                OrderTextField(
                  hintText: 'Место отгрузки',
                  icon: Icons.upload,
                  onTap: (value) {
                    uploadPlace = value;
                    inputData['uploadPlace'] = uploadPlace;
                  },
                ),
                OrderTextField(
                  hintText: 'Место выгрузки',
                  icon: Icons.download,
                  onTap: (value) {
                    downloadPlace = value;
                    inputData['downloadPlace'] = downloadPlace;
                  },
                ),
                OrderTextField(
                  hintText: 'Время отгрузки',
                  icon: Icons.timer,
                  onTap: (value) {
                    uploadTime = value;
                    inputData['uploadTime'] = uploadTime;
                  },
                ),
                OrderTextField(
                  hintText: 'Тип транспорта',
                  icon: Icons.car_crash_outlined,
                  onTap: (value) {
                    transType = value;
                    inputData['transType'] = transType;
                  },
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isUrgent == false) {
                        isUrgent = true;
                      } else {
                        isUrgent = false;
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        isUrgent ? Icons.check_box : Icons.square,
                        color: Colors.deepOrange,
                        size: 30.0,
                      ),
                      Text(
                        'Срочный заказ',
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _firestore.collection('orders').add({
                      'downloadPlace': downloadPlace,
                      'uploadPlace': uploadPlace,
                      'uploadTime': uploadTime,
                      'isUrgent': isUrgent,
                      'transType': transType,
                      'username': loggedinUser.email
                    });
                    Navigator.pop(context, inputData);
                    print(inputData);
                    inputData['isUrgent'] = isUrgent;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.0)),
                    width: 280.0,
                    height: 40.0,
                    margin: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        'Отправить заявку',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomPanelWidget(),
        ],
      ),
    );
  }
}

class OrderTextField extends StatelessWidget {
  OrderTextField(
      {required this.hintText, required this.icon, required this.onTap});

  final String hintText;
  final IconData icon;
  Function onTap;

  TextEditingController orderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: TextField(
        controller: orderController,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          icon: Icon(
            icon,
            color: Colors.black,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          value.toString();
          onTap(value);
        },
      ),
    );
  }
}
