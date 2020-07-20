import '../utils/net_base.dart';
import 'api.dart';

class Net {
  // 登录
  static Future Login(Map<String, String> params) async {
    var res = await NetBase.post(API.LOGIN, params);
    try {
      return res;
    } catch (err) {
      return res ? res : err;
    }
  }

  // 获取用户信息
  static Future UserInfo() async {
    var res = await NetBase.get(API.GET_USER_INFO);
    try {
      return res;
    } catch(err) {
      return res ? res : err;
    }
  }

  // 获取患者列表
  static Future getPatList() async {
    var res = await NetBase.get(API.PAT_LIST);
    try {
      return res;
    } catch(err) {
      return res ? res : err;
    }
  }

  // 获取患者列表
  static Future switchPat(patId) async {
    var res = await NetBase.post(API.SWITCH_PAT+'$patId', null);
    try {
      return res;
    } catch(err) {
      return res ? res : err;
    }
  }

  // 患者听诊记录列表
  static Future getRecordList(patId) async {
    var res = await NetBase.get(API.RECORD_LIST+'$patId');
    try {
      return res;
    } catch(err) {
      return res ? res : err;
    }
  }

  // 临时听诊记录
  static Future getTempRecordList() async {
    var res = await NetBase.get(API.TEMP_RECORD_LIST);
    try {
      return res;
    } catch(err) {
      return res ? res : err;
    }
  }

  // 修改账号姓名
  static Future updateUserName(String name) async {
    var res = await NetBase.post(API.UPDATE_USER_NAME, {"Name": name});
    try {
      return res;
    } catch(err) {
      return res ? res : err;
    }
  }

  // 修改密码
  static Future updatePass(String OldPass, String NewPass) async {
    var res = await NetBase.post(API.UPDATE_PASS, {"OldPass": OldPass, "NewPass": NewPass});
    try {
      return res;
    } catch(err) {
      return res ? res : err;
    }
  }

  // 添加患者
  static Future addPat(Map<String, dynamic> patInfo) async {
    var res = await NetBase.post(API.ADD_PAT, patInfo);
    try {
      return res;
    } catch(err) {
      return res ? res : err;
    }
  }

}