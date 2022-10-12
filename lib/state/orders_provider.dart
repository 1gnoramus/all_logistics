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

  Future<List<OrderModel>> getInProcOrders() async {
    List<OrderModel> orderBoxesList = [];

    try {
      final response = await _firestore.collection('inProcessingOrders').get();
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
      throw Exception('Exception on getInProcOrders: $e');
    }
  }

  Future<List<OrderModel>> getAcceptedOrders() async {
    List<OrderModel> orderBoxesList = [];

    try {
      final response = await _firestore.collection('acceptedOrders').get();
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
      throw Exception('Exception on getAcceptedOrders: $e');
    }
  }

  Future<List<OrderModel>> getRejectedOrders() async {
    List<OrderModel> orderBoxesList = [];

    try {
      final response = await _firestore.collection('rejectedOrders').get();
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
      throw Exception('Exception on getRejectedOrders: $e');
    }
  }
}
