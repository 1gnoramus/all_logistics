import 'package:all_log/new_order_page.dart';
import 'package:flutter/material.dart';
import 'order_info.dart';
import 'bottom_data.dart';
import 'order_type.dart';

class OrderPage extends StatefulWidget {
  OrderPage({this.logOrder});

  final logOrder;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String uploadPlace = '';
  String downloadPlace = '';
  String uploadTime = '';
  String transpType = '';

  NewOrderPage newOrderPage = NewOrderPage();

  @override
  void initState() {
    super.initState();
    updateInfo(widget.logOrder);
    addOrderBlock(widget.logOrder);
  }

  List<Widget> widgetKeeper = [];
  void addOrderBlock(orderData) {
    setState(() {
      if (orderData != null) {
        print('Suck: 1');
        widgetKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        print('Suck: 2');
        widgetKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      }
    });
    print(widgetKeeper.length);
  }

  void updateInfo(dynamic orderData) {
    setState(
      () {
        if (orderData == null) {
          uploadPlace = 'None';
          downloadPlace = 'None';
          uploadTime = 'None';
          transpType = 'None';
        } else {
          uploadPlace = orderData['uploadPlace'];
          downloadPlace = orderData['downloadPlace'];
          uploadTime = orderData['uploadTime'];
          transpType = orderData['transType'];
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
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
          Row(
            children: widgetKeeper,
          ),

          OrderInfo(Icons.auto_awesome, uploadPlace, downloadPlace, uploadTime,
              transpType),
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
          OrderInfo(
              Icons.auto_awesome, 'Бишкек', 'Пекин', '20:00', '20-футТрак'),
          OrderInfo(Icons.auto_awesome, 'Усть-Каменогорск', 'Нурсултан',
              '19:00', 'Газель'),
          BottomPanelWidget(),
          // FloatingActionButton(onPressed: floatBut),
        ],
      ),
    );
  }
}
