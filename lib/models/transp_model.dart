import 'package:all_log/models/company_model.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:all_log/models/company_model.dart';
part 'transp_model.g.dart';

@JsonSerializable()
class TransportModel {
  TransportModel({
    required this.transportId,
    required this.transportNumber,
    required this.company,
    required this.transportType,
    required this.transportStatus,
    required this.transportModel,
  });

  final int transportId;
  final String transportNumber;
  final CompanyModel company;
  final String transportType;
  final String transportStatus;
  final String transportModel;

  factory TransportModel.fromJson(Map<String, dynamic> json) {
    return _$TransportModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TransportModelToJson(this);
  }
}
