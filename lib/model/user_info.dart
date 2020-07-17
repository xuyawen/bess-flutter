import 'dart:convert';

class UserInfo {
  DeviceType Device;
  PatientType Patient;
  UserType User;

  UserInfo();
}

class DeviceType {
  int ID;
  String Name;
  String SN;
  String Mac;
  String UpdatedAt;
  String CreatedAt;
  String Birthday;
  int RecordNumber;
  int RecordCount;

  DeviceType(this.RecordNumber, this.Name, this.ID, this.Birthday, this.CreatedAt, this.Mac, this.RecordCount, this.SN, this.UpdatedAt);
}

class PatientType {
  int ID;
  String Name;
  String Sex;
  String Birthday;
  int RecordNumber;

  PatientType(this.Birthday, this.ID, this.Name, this.RecordNumber, this.Sex);
}

class UserType {
  String Username;
  String Name;
  int Status;
  int Role;

  UserType(this.Name, this.Role, this.Status, this.Username);
}