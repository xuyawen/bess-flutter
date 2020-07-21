// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return UserData()
    ..Device = json['Device'] as Map<String, dynamic>
    ..Patient = json['Patient'] as Map<String, dynamic>
    ..User = json['User'] as Map<String, dynamic>;
}

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'Device': instance.Device,
      'Patient': instance.Patient,
      'User': instance.User
    };
