import 'package:flutter/material.dart';

class AuscultationPage extends StatefulWidget {
  @override
  _AuscultationPageState createState() => _AuscultationPageState();
}

class _AuscultationPageState extends State<AuscultationPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('听诊'),
        ),
      ),
    );
  }
}
