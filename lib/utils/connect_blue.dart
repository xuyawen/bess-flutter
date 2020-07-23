import 'dart:async';
import 'dart:developer';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:bess/common/global.dart';

enum ConnectState {
  unUnited,
  success,
  error,
}

class Blue {

  static FlutterBlue _blue = FlutterBlue.instance;
  static ConnectState connectState = ConnectState.unUnited;
  static bool _isOpenBlue = false;
  static Timer _delayed;
  static BluetoothDevice device;
  static Set _blueList = Set();

  static getDrive() async {
    _blue.startScan(timeout: Duration(seconds: 4));
    _blue.scanResults.listen((result) {
      for (ScanResult r in result) {
//        if (r.device.name != '') _blueList.add(r.device);
        if (!_blueList.contains(r.device)) _blueList.add(r.device);
      }
    });
    connectBlue();
//    log("_blueList: $_blueList");
//    subscription?.cancel();
//    _blueList.forEach((res) {
//      print(res);
//    });
  }

  static stopScan() {
    _blue.stopScan();
  }

  static void scan() {
    _blueList = Set();
    _blue.scan()
        .listen((result) {
//      if (!_blueList.contains(result.device)) _blueList.add(result.device);
      if (result.device.name != '') _blueList.add(result.device);
      // log("_blueList: $_blueList");
    });

    Future.delayed(Duration(seconds: 4), () {
      _blue.stopScan();
      log("_blueList: $_blueList");
//      scanSubscription?.cancel();
    });
  }

  static void scanBlue() {
    Timer _timer;
    // 监听蓝牙连接状态
    _blue.state.listen((state) {
      // 蓝牙是否开启
      if (state == BluetoothState.on) {
        _isOpenBlue = true;
        // 停止蓝牙扫描
        _blue.stopScan();
        // 执行一次
        scan();
        _timer = Timer.periodic(Duration(seconds: 10), (_) => scan());
      } else {
        _timer?.cancel();
        if (!_isOpenBlue) print('蓝牙未开启');
      }
    });
  }

  static void connectBlue() {
    _blueList.forEach((res) async {
      if (res.device.name == Global.deviceData["Name"]) {
        print("蓝牙设备正在连接...");
        await res.device.disconnect();
        await res.device.connect();
        connectState = ConnectState.success;
        print('连接成功');
        List<BluetoothService> services = await res.device.discoverServices();
        services.forEach((service) {
          print(service);
          // 监听其抛出数据
          if (service.uuid.toString().toUpperCase().substring(4, 8) == 'FFF0') {
            // 对设备进行操作
          }

        });
      }

      var stateSubscription = res.device.state.listen((state) async {
        print("连接状态：$state");
        switch(state) {
          case BluetoothDeviceState.connected:
            // 连接成功
            break;
          case BluetoothDeviceState.disconnected:
            // 连接断开 or 失败
            break;
          default:
            // 连接断开 or 失败
        }
      });
    });
  }

}