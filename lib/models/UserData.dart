import 'package:json_annotation/json_annotation.dart';

part 'UserData.g.dart';

@JsonSerializable()
class UserData {
    UserData();

    Map<String,dynamic> Device;
    Map<String,dynamic> Patient;
    Map<String,dynamic> User;
    
    factory UserData.fromJson(Map<String,dynamic> json) => _$UserDataFromJson(json);
    Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
