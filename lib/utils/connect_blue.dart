import 'dart:async';
import 'dart:developer';
import 'package:flutter_blue/flutter_blue.dart';

class Blue {

  static FlutterBlue _blue = FlutterBlue.instance;

  static bool _isOpenBlue = false;
  static Timer _delayed;
  static BluetoothDevice device;
  static Set _blueList = Set();

  static startScan() {
    _blue.startScan(timeout: Duration(seconds: 4));
  }

  static getDrive() {
    var subscription = _blue.scanResults.listen((result) {
      for (ScanResult r in result) {
        device = r.device;
      }
    });
    print("subscription: $subscription");
  }

  static stopScan() {
    _blue.stopScan();
  }

  static void _scan() {
    _blueList = Set();
    var scanSubscription = _blue.scan()
        .listen((result) {
      if (!_blueList.contains(result)) _blueList.add(result);
      log("_blueList: $_blueList");
    });

    Future.delayed(Duration(seconds: 10), () {
      _blue.stopScan();
      scanSubscription?.cancel();
    });
  }

  static Future<dynamic> scanBlue() {
    Timer _timer;
    // 监听蓝牙连接状态
    _blue.state.listen((state) {
      // 蓝牙是否开启
      if (state == BluetoothState.on) {
        _isOpenBlue = true;
        // 停止蓝牙扫描
        _blue.stopScan();
        // 执行一次
        _scan();
        _timer = Timer.periodic(Duration(seconds: 20), (_) => _scan());
      } else {
        _timer?.cancel();
        if (!_isOpenBlue) print('蓝牙未开启');
      }
    });
  }

}