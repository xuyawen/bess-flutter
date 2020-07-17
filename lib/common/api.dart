class API {
  static const String BASE_URL = 'http://test-bess.hiwein.com/api';
  //登陆
  static const String LOGIN = BASE_URL + '/app/login';
  // 信息初始化
  static const String GET_USER_INFO = BASE_URL + '/app/init';
  // 患者列表
  static const String PAT_LIST = BASE_URL + '/app/patient/list';
  // 切换患者
  static const String SWITCH_PAT = BASE_URL + '/app/patient/switch/';
  // 患者听诊记录列表
  static const String RECORD_LIST = BASE_URL + '/app/record/list/';
}