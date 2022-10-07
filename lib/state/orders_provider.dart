import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:all_log/models/order_model.dart';

final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;
late User loggedinUser;

class OrderProvider {
  Future<List<OrderModel>> getDriverOrders() async {
    List<OrderModel> orderBoxesList = [];

    try {
      final response = await _firestore.collection('Orders').get();
      print(response.runtimeType);
      // JSON -> UserModel
      for (var resp in response.docs) {
        print(resp.data());
        var orderModel = OrderModel.fromJson(resp.data());
        orderBoxesList.add(orderModel);
      }
      print(orderBoxesList.length);

      return orderBoxesList;
    } catch (e) {
      throw Exception('Exception on getDriverOrders: $e');
    }
  }

  // Future <List<AcceptedHistory>> getLogAcceptedOrders ()async{
  //   List<AcceptedHistory> historyList = [];
  //  try {
  //   final response = await _firestore.collection('acceptedOrders').get();
  //   print(response);
  //       return historyList;

  //     throw Exception("User is not exists");
  //   } catch (e) {
  //     throw Exception('Exception on getLogAcceptedOrders: $e');
  //   }
  // }

  //   Future <List<InProcHistory>> getLogInProcOrders ()async{
  //       List<InProcHistory> historyList = [];
  //  try {
  //       return historyList;

  //     throw Exception("User is not exists");
  //   } catch (e) {
  //     throw Exception('Exception on getLogInProcOrders: $e');
  //   }
  // }

  //   Future <List<AcceptedHistory>> getLogRejectedOrders ()async{
  //       List<AcceptedHistory> historyList = [];
  //  try {
  //       return historyList;

  //     throw Exception("User is not exists");
  //   } catch (e) {
  //     throw Exception('Exception on getLogRejectedOrders: $e');
  //   }
  // }

}
