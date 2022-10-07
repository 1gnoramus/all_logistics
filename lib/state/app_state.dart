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
}
