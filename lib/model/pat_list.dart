class PatList {
  List<Pat> list;

  PatList();
}

class Pat {
  int ID;
  String UID;
  String Name;
  String Sex;
  String Birthday;
  String RecordNumber;
  int RecordCount;

  Pat(this.Name, this.RecordCount, this.Birthday, this.ID, this.RecordNumber, this.Sex, this.UID);
}