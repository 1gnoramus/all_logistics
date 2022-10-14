// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) => CompanyModel(
      companyId: json['companyId'] as int,
      name: json['name'] as String,
      companyType: json['companyType'] as String,
    );

Map<String, dynamic> _$CompanyModelToJson(CompanyModel instance) =>
    <String, dynamic>{
      'companyId': instance.companyId,
      'name': instance.name,
      'companyType': instance.companyType,
    };
