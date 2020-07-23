import 'dart:async';
import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:bess/common/global.dart';

Map<String, dynamic> optHeader = {
  'accept-language': 'zh-cn',
  'content-type': 'application/json',
};

var dio = new Dio(BaseOptions(connectTimeout: 30000, headers: optHeader));

// 代理
String _ip = '192.168.0.33:8888';
final bool hasProxy = false;

class NetBase {
  static Future get(String url, [Map<String, dynamic> params]) async {
    var response;
    // 设置代理 charles 抓包
    if (hasProxy) (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.findProxy = (uri) {
        return "PROXY $_ip";
      };
    };
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String documentsPath = documentsDir.path;
    var dir = new Directory("$documentsPath/cookies");
    await dir.create();
    dio.interceptors.addAll([
      CookieManager(PersistCookieJar(dir: dir.path)),
      InterceptorsWrapper(
        onRequest:(Options options) async {
          String _token = Global.getToken();
          options.headers["Authorization"] = _token;
          return options;
        })
      ]
    );

    if (params != null) {
      response = await dio.get(url, queryParameters: params);
    } else {
      response = await dio.get(url);
    }
    return response.data;
  }

  static Future post(String url, Map<String, dynamic> params) async {
    // // 设置代理 charles 抓包
    if (hasProxy) (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.findProxy = (uri) {
        return "PROXY $_ip";
      };
    };
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String documentsPath = documentsDir.path;
    var dir = new Directory("$documentsPath/cookies");
    await dir.create();
    dio.interceptors.addAll([
      CookieManager(PersistCookieJar(dir: dir.path)),
      InterceptorsWrapper(
        onRequest:(Options options) async {
          String _token = Global.getToken();
          options.headers["Authorization"] = _token;
          return options;
        })
    ]);
    var response = await dio.post(url, data: params);
    return response.data;
  }
}
