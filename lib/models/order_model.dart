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
  });

  final String username;
  final String uploadPlace;
  final String downloadPlace;
  final String uploadTime;
  final String transType;
  final int orderNum;
  final bool isUrgent;
  final String orderId;

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return _$OrderModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderModelToJson(this);
  }
}
