// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userId: json['userId'] as int,
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      age: json['age'] as String,
      locationState: json['locationState'] as String,
      locationCity: json['locationCity'] as String,
      rating: json['rating'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'age': instance.age,
      'locationState': instance.locationState,
      'locationCity': instance.locationCity,
      'rating': instance.rating,
    };
