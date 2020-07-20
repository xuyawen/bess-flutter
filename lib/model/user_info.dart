class UserInfo {
  DeviceType Device;
  PatientType Patient;
  UserType User;

  UserInfo();

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    UserInfo userInfo = UserInfo();

    DeviceType Device = DeviceType(
        json['Device']['RecordNumber'],
        json['Device']['Name'],
        json['Device']['ID'],
        json['Device']['Birthday'],
        json['Device']['CreatedAt'],
        json['Device']['Mac'],
        json['Device']['RecordCount'],
        json['Device']['SN'],
        json['Device']['UpdatedAt']);
    userInfo.Device = Device;

    PatientType Patient = PatientType(
        json['Patient']['Birthday'],
        json['Patient']['ID'],
        json['Patient']['Name'],
        json['Patient']['RecordNumber'],
        json['Patient']['Sex']);
    userInfo.Patient = Patient;

    UserType User = UserType(json['User']['Name'], json['User']['Role'],
        json['User']['Status'], json['User']['Username']);
    userInfo.User = User;

    return userInfo;
  }
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

  DeviceType(this.RecordNumber, this.Name, this.ID, this.Birthday,
      this.CreatedAt, this.Mac, this.RecordCount, this.SN, this.UpdatedAt);
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
