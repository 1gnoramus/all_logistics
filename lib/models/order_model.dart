import 'package:json_annotation/json_annotation.dart';
part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  OrderModel({
    required this.userName,
    required this.uploadPlace,
    required this.downloadPlace,
    required this.uploadTime,
    required this.transType,
    required this.orderNum,
    required this.isUrgent,
    required this.orderId,
  });

  final String userName;
  final String uploadPlace;
  final String downloadPlace;
  final String uploadTime;
  final String transType;
  final String orderNum;
  final String isUrgent;
  final String orderId;

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return _$OrderModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderModelToJson(this);
  }
}
