import 'package:flutter/material.dart';
import 'views/main_page.dart';
import 'views/prompt_page.dart';
// import 'components/bottom_navbar.dart';

void main() => runApp(Client());

class Client extends StatelessWidget {
  @override
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
