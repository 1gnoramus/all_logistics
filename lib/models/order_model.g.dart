// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      downloadPlace: json['downloadPlace'] as String,
      isUrgent: json['isUrgent'] as bool,
      orderId: json['orderId'] as String,
      orderNum: json['orderNum'] as int,
      transType: json['transType'] as String,
      username: json['username'] as String,
      uploadPlace: json['uploadPlace'] as String,
      uploadTime: json['uploadTime'] as String,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'uploadPlace': instance.uploadPlace,
      'downloadPlace': instance.downloadPlace,
      'uploadTime': instance.uploadTime,
      'transType': instance.transType,
      'orderNum': instance.orderNum,
      'isUrgent': instance.isUrgent,
      'orderId': instance.orderId,
    };
