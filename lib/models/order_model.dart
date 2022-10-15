import 'package:all_log/models/driver_model.dart';
import 'package:all_log/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  OrderModel({
    required this.downloadPlace,
    required this.isUrgent,
    this.orderId,
    this.orderNum,
    required this.transType,
    required this.username,
    required this.uploadPlace,
    required this.uploadTime,
    required this.orderStatus,
    required this.cargoType,
    required this.cargoWeight,
    required this.cargoVolume,
    this.driverId,
  });

  final String username;
  final String orderStatus;
  final String uploadPlace;
  final String downloadPlace;
  final String uploadTime;
  final String transType;
  int? orderNum;
  final bool isUrgent;
  String? orderId;
  final String cargoType;
  String? driverId;

  final String cargoWeight;
  final String cargoVolume;

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return _$OrderModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderModelToJson(this);
  }
}
