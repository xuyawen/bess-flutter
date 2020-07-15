import 'package:flutter/material.dart';
import '../main_page.dart';

class AuscultationPage extends StatefulWidget {
  @override
  _AuscultationPageState createState() => _AuscultationPageState();
}

class _AuscultationPageState extends State<AuscultationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              image: AssetImage("images/wellcome.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: _startWidget(),
        ),
      ),
    );
  }

  // 等待连接
  Widget _waitWidget() {
    return GestureDetector(
      child: Stack(
        alignment:Alignment.center,
        children: <Widget>[
          Positioned(
            top: 40,
            left: 10,
            child: Icon(Icons.close, size: 30, color: Colors.white,),
          ),
          Positioned(
            top: 40,
            right: 10,
            child: Text('临时听诊记录', style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          Positioned(
            top: 180,
            child: Text('晚上好，王医生', style: TextStyle(color: Colors.white, fontSize: 25)),
          ),
          Positioned(
            child: Image.asset("images/hearing.png", width: 120, height: 120),
          ),
          Positioned(
            bottom: 50,
            child: Text('长按听诊器“L”键，开始听诊', style: TextStyle(color: Colors.white, fontSize: 20)),
          )
        ],
      ),
    );
  }
  // 开始听诊
  Widget _startWidget() {
    return GestureDetector(
      child: Stack(
        alignment:Alignment.center,
        children: <Widget>[
          Positioned(
            top: 40,
            left: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MainPage()));
              },
              child: Icon(Icons.close, size: 30, color: Colors.white,),
            ),
          ),
          Positioned(
            top: 40,
            left: 60,
            child: Wrap(
              spacing: 6,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                Text('赵磊磊', style: TextStyle(fontSize: 20, color: Colors.white)),
                Icon(Icons.person, color: Colors.white,),
                Text('5岁', style: TextStyle(fontSize: 18, color: Colors.white))
              ],
            ),
          ),
          Positioned(
            top: 180,
            child: Text('听诊过程中请勿随意移动听诊器', style: TextStyle(color: Colors.white, fontSize: 25)),
          ),
          Positioned(
            child: Image.asset("images/hearing.png", width: 120, height: 120),
          ),
          Positioned(
            bottom: 200,
            left: 20,
            child: Text('心率：--', style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
          Positioned(
            bottom: 200,
            right: 20,
            child: Text('00:14', style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
          Positioned(
            bottom: 150,
            child: Text('~~~~', style: TextStyle(color: Colors.white, fontSize: 20)),
          )
        ],
      ),
    );
  }
}
