import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';


class BlocProvider extends InheritedWidget {
  final UserBLoC userBLoC = UserBLoC();

  BlocProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static UserBLoC of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<BlocProvider>()).userBLoC;
}

class UserBLoC {
  dynamic _userData;
  var _subject = BehaviorSubject<dynamic>();

  Stream<dynamic> get stream => _subject.stream;

  dynamic get value => _userData;

  void setUserData(state) => _subject.add(state);

  void save(state) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('_userData', jsonEncode(state));
  }

  void dispose() {
    _subject.close();
  }
}