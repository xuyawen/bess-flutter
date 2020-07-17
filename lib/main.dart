import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:bess/routes/routers.dart';
import 'views/main_page.dart';
import 'views/prompt_page.dart';

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
      title: 'BESS',
      // 自定义主题样本
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: true ? PromptPage() : MainPage(),
      // home: BottomNavBar(),
    );
  }

}

void main() => runApp(MyApp());
