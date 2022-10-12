import 'package:flutter/material.dart';
import 'package:all_log/state/orders_provider.dart';

import '../models/order_model.dart';

class AppStateManager extends ChangeNotifier {
  AppStateManager({required this.orderProvider});
  final OrderProvider? orderProvider;

  List<OrderModel>? _orders;
  List<OrderModel>? get orders => _orders;

  Map<List, dynamic> newOrders = {};

  Future<void> getDriverOrders() async {
    try {
      final response = await orderProvider?.getDriverOrders();
      _orders = response;
    } catch (e) {
      throw Exception('Exception on getDriverOrders: $e');
    }
    notifyListeners();
  }

  Future<void> getInProcOrders() async {
    try {
      final response = await orderProvider?.getInProcOrders();
      _orders = response;
    } catch (e) {
      throw Exception('Exception on getDriverOrders: $e');
    }
    notifyListeners();
  }

  Future<void> getAcceptedOrders() async {
    try {
      final response = await orderProvider?.getAcceptedOrders();
      _orders = response;
    } catch (e) {
      throw Exception('Exception on getAcceptedOrders: $e');
    }
    notifyListeners();
  }

  Future<void> getRejectedOrders() async {
    try {
      final response = await orderProvider?.getRejectedOrders();
      _orders = response;
    } catch (e) {
      throw Exception('Exception on getRejectedOrders: $e');
    }
    notifyListeners();
  }
}
