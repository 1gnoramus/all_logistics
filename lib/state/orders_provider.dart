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

  Future placeNewOrder(OrderModel orderModel) async {
    try {
      var order = orderModel.toJson();
      await _firestore
          .collection('Orders')
          .add(order)
          .then((value) => print('Success'));
    } catch (e) {
      throw Exception('Exception on placeNewOrder: $e');
    }
  }

  Future changeOrderStatus_InProc(orderId) async {
    try {
      final response = await _firestore
          .collection('Orders')
          .doc(orderId)
          .update({'orderStatus': 'inProcess'}).then(
              (value) => print('Success'));
    } catch (e) {
      throw Exception('Exception on orderPicker: $e');
    }
  }

  Future changeOrderStatus_Accepted(orderId) async {
    try {
      final response = await _firestore
          .collection('Orders')
          .doc(orderId)
          .update({'orderStatus': 'accepted'}).then(
              (value) => print('Success'));
    } catch (e) {
      throw Exception('Exception on orderPicker: $e');
    }
  }

  Future changeOrderStatus_Rejected(orderId) async {
    try {
      final response = await _firestore
          .collection('Orders')
          .doc(orderId)
          .update({'orderStatus': 'rejected'}).then(
              (value) => print('Success'));
    } catch (e) {
      throw Exception('Exception on orderPicker: $e');
    }
  }

  Future changeOrderStatus_Completed(orderId) async {
    try {
      final response = await _firestore
          .collection('Orders')
          .doc(orderId)
          .update({'orderStatus': 'completed'}).then(
              (value) => print('Success'));
    } catch (e) {
      throw Exception('Exception on orderPicker: $e');
    }
  }

  Future changeOrderStatus_Deleted(orderId) async {
    try {
      final response = await _firestore
          .collection('Orders')
          .doc(orderId)
          .update({'orderStatus': 'deleted'}).then((value) => print('Success'));
    } catch (e) {
      throw Exception('Exception on orderPicker: $e');
    }
  }
}
