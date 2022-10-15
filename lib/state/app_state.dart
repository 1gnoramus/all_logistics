import 'package:flutter/material.dart';
import 'package:all_log/state/orders_provider.dart';

import '../models/order_model.dart';

class AppStateManager extends ChangeNotifier {
  AppStateManager({required this.orderProvider});
  final OrderProvider? orderProvider;

  List<OrderModel>? _orders;
  List<OrderModel>? get orders => _orders;

  Map<List, dynamic> newOrders = {};

  Future<void> changeOrderStatus_InProc(orderId) async {
    try {
      final response = await orderProvider?.changeOrderStatus_InProc(orderId);
    } catch (e) {
      throw Exception('Exception on getDriverOrders: $e');
    }
    notifyListeners();
  }

  Future<void> changeOrderStatus_Accepted(orderId) async {
    try {
      final response = await orderProvider?.changeOrderStatus_Accepted(orderId);
    } catch (e) {
      throw Exception('Exception on getDriverOrders: $e');
    }
    notifyListeners();
  }

  Future<void> changeOrderStatus_Rejected(orderId) async {
    try {
      final response = await orderProvider?.changeOrderStatus_Rejected(orderId);
    } catch (e) {
      throw Exception('Exception on getDriverOrders: $e');
    }
    notifyListeners();
  }

  Future<void> changeOrderStatus_Completed(orderId) async {
    try {
      final response =
          await orderProvider?.changeOrderStatus_Completed(orderId);
    } catch (e) {
      throw Exception('Exception on getDriverOrders: $e');
    }
    notifyListeners();
  }

  Future<void> changeOrderStatus_Deleted(orderId) async {
    try {
      final response = await orderProvider?.changeOrderStatus_Deleted(orderId);
    } catch (e) {
      throw Exception('Exception on getDriverOrders: $e');
    }
    notifyListeners();
  }

  Future<void> getDriverOrders() async {
    try {
      final response = await orderProvider?.getDriverOrders();
      _orders = response;
    } catch (e) {
      throw Exception('Exception on getDriverOrders: $e');
    }
    notifyListeners();
  }

  Future<void> placeNewOrder(orderModel) async {
    try {
      final response = await orderProvider?.placeNewOrder(orderModel);
    } catch (e) {
      throw Exception('Exception on placeNewOrder: $e');
    }
    notifyListeners();
  }
}
