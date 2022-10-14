import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
part 'company_model.g.dart';

@JsonSerializable()
class CompanyModel {
  CompanyModel({
    required this.companyId,
    required this.name,
    required this.companyType,
  });

  final int companyId;
  final String name;
  final String companyType;

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return _$CompanyModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CompanyModelToJson(this);
  }
}
