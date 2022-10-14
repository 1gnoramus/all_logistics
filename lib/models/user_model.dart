import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  UserModel(
      {required this.userId,
      required this.email,
      required this.password,
      required this.name,
      required this.phoneNumber,
      required this.age,
      required this.locationState,
      required this.locationCity,
      required this.rating});

  final int userId;
  final String email;
  final String password;
  final String name;
  final String phoneNumber;
  final String age;
  final String locationState;
  final String locationCity;
  final String rating;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserModelToJson(this);
  }
}
