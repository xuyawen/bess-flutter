import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:bess/models/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
// 提供五套可选主题色
const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class Global {
  // 保存用户信息
  static UserData _userData;

  static SharedPreferences _prefs;

  // 可选的主题列表
  static List<MaterialColor> get themes => _themes;

  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    var _profile = _prefs.getString("profile");
    if (_profile != null) {
      try {
        _userData = UserData.fromJson(jsonDecode(_profile));
        print('_userData: $_userData');
      } catch (e) {
        print(e);
      }
    }
  }

  // 保存 userData
  static saveUserData(userData) {
    _prefs.setString("_userData", jsonEncode(userData));
  }
}