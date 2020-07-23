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
  static Map userData = Map();
  static Map patData = Map();
  static Map deviceData = Map();
  static Map userInfo = Map();

  static SharedPreferences _prefs;

  // 可选的主题列表
  static List<MaterialColor> get themes => _themes;

  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    var _userData = _prefs.getString("_userData");
    if (_userData != null) {
      try {
        userData = jsonDecode(_userData);
      } catch (e) {
        print(e);
      }
    }
  }

  // 保存
  static setPref(String key, dynamic value) {
    _prefs.setString(key, jsonEncode(value));
  }

  // 读取
  static dynamic getPref(String key) {
    return jsonDecode(_prefs.getString(key));
  }

  // 移除
  static removePref(String key) {
    _prefs.remove(key);
  }

  // 保存 token
  static saveToken(String key, dynamic value) {
    _prefs.setString(key, value);
  }

  // 读取 token
  static String getToken() {
    return _prefs.getString("_token");
  }

  // 保存 userData
  static saveUserData(userData) {
    userData = userData;
    deviceData = userData["Device"];
    _prefs.setString("_userData", jsonEncode(userData));
  }

  // 保存 currentPat
  static saveCurrentPat(patData) {
    patData = patData;
    _prefs.setString("_currentPat", jsonEncode(patData));
  }

  // 读取 userData
  static getUserData() {
    return jsonDecode(_prefs.getString("_userData"));
  }

  // 读取 currentPat
  static getCurrentPat() {
    return jsonDecode(_prefs.getString("_currentPat"));
  }
}