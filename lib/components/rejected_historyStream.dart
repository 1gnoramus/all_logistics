import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:all_log/components/order_data.dart';
import 'package:all_log/components/history_rapid_data_block.dart';
import 'package:all_log/components/colourful_button.dart';

import '../state/app_state.dart';

final _auth = FirebaseAuth.instance;

final _firestore = FirebaseFirestore.instance;
late User loggedinUser;

class RejectedHistory extends StatelessWidget {
  RejectedHistory({
    required this.custUserName,
    required this.uploadPlace,
    required this.downloadPlace,
    required this.uploadTime,
    required this.transType,
    required this.orderNum,
    required this.orderId,
    required this.status,
    required this.color,
  });

  final String custUserName;
  final String orderNum;
  final String orderId;
  final String uploadTime;
  final String uploadPlace;
  final String downloadPlace;
  final String transType;
  final String status;
  final Color color;

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
                          style:
                              TextStyle(fontSize: 20.0, color: Colors.black54),
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
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
                        ColourfulButton(
                            buttonColor: Colors.redAccent,
                            onTap: () async {
                              Provider.of<AppStateManager>(context,
                                      listen: false)
                                  .changeOrderStatus_Deleted(orderId);
                              Navigator.pop(context);
                            },
                            buttonText: 'Удалить запрос')
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        child: HistRapidData(
            orderNum: orderNum, custUserName: custUserName, color: color));
  }
}
