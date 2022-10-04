// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      userName: json['userName'] as String,
      uploadPlace: json['uploadPlace'] as String,
      downloadPlace: json['downloadPlace'] as String,
      uploadTime: json['uploadTime'] as String,
      transType: json['transType'] as String,
      orderNum: json['orderNum'] as String,
      isUrgent: json['isUrgent'] as String,
      orderId: json['orderId'] as String,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'uploadPlace': instance.uploadPlace,
      'downloadPlace': instance.downloadPlace,
      'uploadTime': instance.uploadTime,
      'transType': instance.transType,
      'orderNum': instance.orderNum,
      'isUrgent': instance.isUrgent,
      'orderId': instance.orderId,
    };
