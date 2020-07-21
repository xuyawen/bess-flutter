int getAge(String time) {
  List times = time.split("-");
  if (times.isEmpty) return 0;
  int selectYear = int.parse(times[0]);
  int selectMonth = int.parse(times[1]);
  int selectDay = int.parse(times[2]);
  DateTime now = DateTime.now();
  int yearNow = now.year;
  int monthNow = now.month;
  int dayNow = now.day;
  // 用当前年减去出生年，例如2019-1-22 ，出生年日月是2011年-6-1
  //当前值是8
  int yearMinus = yearNow - selectYear;
  //当前值是-5，monthMinus大于0的情况下，证明满8周岁。等于0需要判断dayMinus，小于0的时候age-1
  int monthMinus = monthNow - selectMonth;
  //当前值是21，monthMinus大于0的情况下，配合monthMinus等于0的情况下，age等于原值。否则age等于age-1
  int dayMinus = dayNow - selectDay;
  // 先大致赋值
  int age = yearMinus;
  if (age <= 0) {
    return 0;
  }
  if (monthMinus == 0) {
    if (dayMinus <= 0) {
      age = age - 1;
    }
  } else if (monthMinus < 0) {
    age = age - 1;
  }
  return age;
}

String getUid() {
  DateTime now = DateTime.now();
  int year = now.year;
  Object month = (now.month.toString().length == 1 ? '0${now.month.toString()}' : now.month.toString());
  String day = (now.day.toString().length == 1 ? '0${now.day.toString()}' : now.day.toString());
  String h = (now.hour.toString().length == 1 ? '0${(now.hour+8).toString()}' : (now.hour+8).toString());
  String m = (now.minute.toString().length == 1 ? '0${now.minute.toString()}' : now.minute.toString());
  String s = (now.second.toString().length == 1 ? '0${now.second.toString()}' : now.second.toString());
  String ss = (now.millisecond.toString().length == 1 ? '0${now.millisecond.toString()}' : now.millisecond.toString());
  return '$year$month$day$h$m$s$ss';
}