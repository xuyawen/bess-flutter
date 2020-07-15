import 'package:flutter/material.dart';
import 'change_pass_page.dart';
import 'edit_user_page.dart';
import 'about_page.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 230,
              color: Colors.blue,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 70, bottom: 10),
                      child: Text('李医生', style: TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text('当前账号：199999999999', style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      margin: EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber[50],
                      ),
                      child: Wrap(
                        spacing: 6,
                        children: <Widget>[
                          Icon(Icons.local_hospital, color: Colors.black),
                          Text('角色-医生', style: TextStyle(color: Colors.black))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
              child: Text('我的设备', style: TextStyle(fontSize: 22)),
            ),
            Container(
              margin: EdgeInsets.only(left: 18, right: 18),
              padding: EdgeInsets.only(top: 25, bottom: 5, left: 18, right: 18),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [ //阴影
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.1, 0.1),
                        blurRadius: 4.0
                    )
                  ]
              ),
              child: Wrap(
                children: <Widget>[
                  Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: UnconstrainedBox(
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                            ),
                            child: Icon(Icons.brightness_auto),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          width: 50,
                          height: 50,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('智能电子听诊器', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              Padding(
                                padding: EdgeInsets.only(top: 7),
                                child: Text('MAC: f0:01:5b:0a:a5:5a'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child:  UnconstrainedBox(
                          child: Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Padding(
                              padding: EdgeInsets.all(7),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.headset_off, size: 15, color: Colors.red),
                                      Text('100', style: TextStyle(color: Colors.blue))
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.battery_full, size: 15, color: Colors.blue),
                                      Text('87', style: TextStyle(color: Colors.blue))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFFbfe9f0),),
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFFe6f4ff),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    padding: EdgeInsets.only(top: 5),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey[100], width: 1, style: BorderStyle.solid)),
                    ),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      children: <Widget>[
                        Icon(Icons.swap_horizontal_circle, color: Colors.blue),
                        Text('切换设备', style: TextStyle(fontSize: 18, color: Colors.blue))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
              child: Text('设置', style: TextStyle(fontSize: 22)),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 18, right: 18),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [ //阴影
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.1, 0.1),
                        blurRadius: 4.0
                    )
                  ]
              ),
              child: Wrap(
                spacing: 50,
                children: <Widget>[
                  // EditPage
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (BuildContext context) => EditUserPage()));
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Icon(Icons.edit, color: Colors.white, size: 25,),
                        ),
                        Text('账号设置')
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (BuildContext context) => ChangePassPage()));
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Icon(Icons.vpn_key, color: Colors.white, size: 25,),
                        ),
                        Text('修改密码')
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (BuildContext context) => AboutPage()));
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Icon(Icons.info, color: Colors.white, size: 25,),
                        ),
                        Text('关于我们')
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 18, right: 18, top: 20),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [ //阴影
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.1, 0.1),
                        blurRadius: 4.0
                    )
                  ]
              ),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 9,
                    child: Text('退出登录', style: TextStyle(fontSize: 20, color: Colors.yellow)),
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.chevron_right, color: Colors.grey[300], size: 35,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
