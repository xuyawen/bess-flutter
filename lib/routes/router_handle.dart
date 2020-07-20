import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:bess/views/login/login_page.dart';
import 'package:bess/views/prompt_page.dart';
import 'package:bess/views/main_page.dart';
import 'package:bess/views/home/edit_pat_page.dart';
import 'package:bess/views/auscultation/auscultation_page.dart';
import 'package:bess/views/auscultation/result_auscultate.dart';
import 'package:bess/views/auscultation/temp_auscultate.dart';
import 'package:bess/views/mine/mine_page.dart';
import 'package:bess/views/mine/edit_user_page.dart';
import 'package:bess/views/mine/change_pass_page.dart';
import 'package:bess/views/mine/about_page.dart';

// 登录
var loginHandle = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return LoginPage();
  }
);

// 首次登录
var firstLoginHandle = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return PromptPage();
  }
);

// 首页
var homeHandle = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return MainPage();
    }
);

// 编辑患者
var editPatHandle = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return EditPatPage();
    }
);

// 听诊
var auscultateHandle = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return AuscultationPage();
    }
);

// 听诊结果
var resultAuscultateHandle = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return ResultAuscultate();
    }
);

// 临时听诊记录
var tempAuscultateHandle = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return TempAusculState();
    }
);

// 个人中心
var mineHandle = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return MinePage();
    }
);

// 关于我们
var aboutHandle = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return AboutPage();
    }
);

// 变更密码
var changePassHandle = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return ChangePassPage();
    }
);

// 编辑用户
var editUserHandle = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return EditUserPage();
    }
);