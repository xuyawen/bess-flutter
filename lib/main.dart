import 'package:bess/views/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:bess/routes/routers.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bess/common/global.dart';
//import 'views/main_page.dart';
//import 'views/prompt_page.dart';

class MyApp extends StatefulWidget {
  MyApp() {
    final router = Router();
    Routes.configureRoutes(router);
    Routes.router = router;
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
      title: 'BESS',
      // 自定义主题样本
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: LoginPage(),
//      true ? PromptPage() : MainPage()
      // home: BottomNavBar(),
    );
  }

}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Global.init().then((_) => runApp(MyApp()));
}
