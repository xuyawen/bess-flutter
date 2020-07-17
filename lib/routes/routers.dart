import 'package:fluro/fluro.dart';
import 'router_handle.dart';

class Routes {

  static Router router;

  static void push(context, path) {
    Routes.router
        .navigateTo(context, path, transition: TransitionType.material);
  }

  static String root = '/';
  static String login = '/login';
  static String firstLogin = '/first-login';
  static String home = '/home';
  static String editPat = '/edit-pat';
  static String auscultate = '/auscultate';
  static String resultAuscultate = '/result-auscultate';
  static String tempAuscultate = '/temp-auscultate';
  static String mine = '/mine';
  static String editUser = '/edit-user';
  static String changePass = '/change-pass';
  static String about = '/about';

  static void configureRoutes(Router router) {
    router.define(login, handler: loginHandle);
    router.define(firstLogin, handler: firstLoginHandle);
    router.define(home, handler: homeHandle);
    router.define(editPat, handler: editPatHandle);
    router.define(auscultate, handler: auscultateHandle);
    router.define(resultAuscultate, handler: resultAuscultateHandle);
    router.define(tempAuscultate, handler: tempAuscultateHandle);
    router.define(mine, handler: mineHandle);
    router.define(editUser, handler: editUserHandle);
    router.define(changePass, handler: changePassHandle);
    router.define(about, handler: aboutHandle);
  }
}