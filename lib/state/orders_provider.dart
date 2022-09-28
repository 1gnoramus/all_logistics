
import 'package:all_log/components/accepted_historyStream.dart';
import 'package:all_log/components/inProc_historyStream.dart';
import 'package:all_log/driver/driver_order_info.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:all_log/components/colourful_button.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:all_log/components/order_data.dart';
import 'package:all_log/components/history_rapid_data_block.dart';


final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;
late User loggedinUser;
class OrderProvider {

  Future <List<AcceptedHistory>> getLogAcceptedOrders ()async{
    List<AcceptedHistory> historyList = [];
   try {
    final response = await _firestore.collection('acceptedOrders').get();
    print(response);
        return historyList;

      throw Exception("User is not exists");
    } catch (e) {
      throw Exception('Exception on getLogAcceptedOrders: $e');
    }
  }

    Future <List<InProcHistory>> getLogInProcOrders ()async{
        List<InProcHistory> historyList = [];
   try {
        return historyList;

      throw Exception("User is not exists");
    } catch (e) {
      throw Exception('Exception on getLogInProcOrders: $e');
    }
  }

    Future <List<AcceptedHistory>> getLogRejectedOrders ()async{
        List<AcceptedHistory> historyList = [];
   try {
        return historyList;

      throw Exception("User is not exists");
    } catch (e) {
      throw Exception('Exception on getLogRejectedOrders: $e');
    }
  }

  Future <List<OrderBox>> getDriverOrders()async{
    List<OrderBox> orderBoxesList = [];
    
    try {
        return orderBoxesList;

      throw Exception("User is not exists");
    } catch (e) {
      throw Exception('Exception on getDriverOrders: $e');
    }
  }

  }



