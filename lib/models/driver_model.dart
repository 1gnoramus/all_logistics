import 'package:all_log/models/company_model.dart';
import 'package:all_log/models/transp_model.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
part 'driver_model.g.dart';

@JsonSerializable()
class DriverModel {
  DriverModel(
      {required this.driverId,
      required this.transportId,
      required this.company,
      required this.driverStatus,
      required this.driverLicense});

  final int driverId;
  final TransportModel transportId;
  final CompanyModel company;
  final String driverStatus;
  final String driverLicense;

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return _$DriverModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DriverModelToJson(this);
  }
}
