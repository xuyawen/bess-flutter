import '../utils/net_base.dart';
import 'api.dart';

class Net {
  // 登陆获取用户信息
  static Future Login(Map<String, String> params) async {
    var response = await NetBase.post(API.LOGIN, params);
    try {
      return response;
    } catch (err) {
      return response ? response : err;
    }
  }
}