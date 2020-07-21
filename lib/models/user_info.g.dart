// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User_info _$User_infoFromJson(Map<String, dynamic> json) {
  return User_info()
    ..Device = json['Device'] as Map<String, dynamic>
    ..Patient = json['Patient'] as Map<String, dynamic>
    ..User = json['User'] as Map<String, dynamic>;
}

Map<String, dynamic> _$User_infoToJson(User_info instance) => <String, dynamic>{
      'Device': instance.Device,
      'Patient': instance.Patient,
      'User': instance.User
    };
