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
}