// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverModel _$DriverModelFromJson(Map<String, dynamic> json) => DriverModel(
      driverId: json['driverId'] as int,
      transportId:
          TransportModel.fromJson(json['transportId'] as Map<String, dynamic>),
      company: CompanyModel.fromJson(json['company'] as Map<String, dynamic>),
      driverStatus: json['driverStatus'] as String,
      driverLicense: json['driverLicense'] as String,
    );

Map<String, dynamic> _$DriverModelToJson(DriverModel instance) =>
    <String, dynamic>{
      'driverId': instance.driverId,
      'transportId': instance.transportId,
      'company': instance.company,
      'driverStatus': instance.driverStatus,
      'driverLicense': instance.driverLicense,
    };
