// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransportModel _$TransportModelFromJson(Map<String, dynamic> json) =>
    TransportModel(
      transportId: json['transportId'] as int,
      transportNumber: json['transportNumber'] as String,
      company: CompanyModel.fromJson(json['company'] as Map<String, dynamic>),
      transportType: json['transportType'] as String,
      transportStatus: json['transportStatus'] as String,
      transportModel: json['transportModel'] as String,
    );

Map<String, dynamic> _$TransportModelToJson(TransportModel instance) =>
    <String, dynamic>{
      'transportId': instance.transportId,
      'transportNumber': instance.transportNumber,
      'company': instance.company,
      'transportType': instance.transportType,
      'transportStatus': instance.transportStatus,
      'transportModel': instance.transportModel,
    };
