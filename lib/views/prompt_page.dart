import 'package:flutter/material.dart';
import 'main_page.dart';

class PromptPage extends StatefulWidget{

  PromptPage({Key key}):super(key:key);
  @override
  _PromptPageState createState()=> new _PromptPageState();

}

class _PromptPageState extends State<PromptPage>{

  bool isStartHomePage = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Stack(
          alignment:Alignment.center,
          children: <Widget>[
            Image.asset("images/wellcome.jpg", fit: BoxFit.cover),
            Positioned(
                right: 25.0,
                top: 40.0,
                child: GestureDetector(
                  onTap: goToHomePage,
                  child: Text('跳过绑定',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none
                      ),
                    ),
                )
            ),
            Positioned(
              top: 150.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('晚上好，王医生',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none
                    ),
                  ),
                  Text('需要添加设备才能使用此功能哦~',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none
                    ),
                  ),
                ],
              )
            ),
            Positioned(
              child: Image.asset("images/hearing.png", width: 120, height: 120),
            ),
            Positioned(
              bottom: 50.0,
              child: Container(
                width: 266,
                height: 50,
                child: FlatButton(
                  color: Colors.white,
                  textColor: Colors.blue,
                  highlightColor: Colors.blue,
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  child: Text("添加设备", style: TextStyle(fontSize: 18),),
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  onPressed: goToHomePage,
                ),
              )
            )
          ],
        ),
    );
  }

  //页面初始化状态的方法
  @override
  void initState() {
    super.initState();
    //开启倒计时
    // countDown();
  }

  void countDown() {
    //设置倒计时三秒后执行跳转方法
    var duration = new Duration(seconds: 3);
    new Future.delayed(duration, goToHomePage);
  }

  void goToHomePage(){
    //跳转主页 且销毁当前页面
    Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (context)=> MainPage()), (Route<dynamic> rout)=>false);
    isStartHomePage=true;
  }
}