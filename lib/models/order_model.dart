import 'package:all_log/models/driver_model.dart';
import 'package:all_log/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  OrderModel({
    required this.downloadPlace,
    required this.isUrgent,
    required this.orderId,
    required this.orderNum,
    required this.transType,
    required this.username,
    required this.uploadPlace,
    required this.uploadTime,
    required this.orderStatus,
    required this.cargoType,
    required this.cargoWeight,
    required this.cargoVolume,
    required this.driverId,
  });

  final UserModel username;
  final String orderStatus;
  final String uploadPlace;
  final String downloadPlace;
  final String uploadTime;
  final String transType;
  final int orderNum;
  final bool isUrgent;
  final String orderId;
  final int cargoType;
  final DriverModel driverId;

  final String cargoWeight;
  final String cargoVolume;

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return _$OrderModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderModelToJson(this);
  }
}
