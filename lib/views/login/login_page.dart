import 'package:flutter/material.dart';
import 'package:bess/routes/routers.dart';
import 'package:bess/common/net.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  TextEditingController _userController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue,
          image: DecorationImage(
            image: AssetImage("images/wellcome.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 120,
              child: Container(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    Image.asset("images/hearing.png", width: 80, height: 80),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('电子听诊器',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text('欢迎使用 请登录',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                padding: EdgeInsets.fromLTRB(15, 40, 15, 10),
                height: 369,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      //阴影
                      BoxShadow(color: Colors.grey, blurRadius: 4.0)
                    ]),
                child: Form(
                  key: _formKey,
                  autovalidate: true,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 80,
                        child: TextFormField(
                          controller: _userController,
                          decoration: InputDecoration(
                              labelText: '账号',
                              hintText: '请输入账号',
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: Colors.grey[200],
                                ),
                              )),
                          validator: (v) {
                            return v.trim().length > 0 ? null : '';
                          },
                        ),
                      ),
                      Container(
                        height: 80,
                        child: TextFormField(
                          controller: _passController,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: '密码',
                              hintText: '请输入密码',
                              prefixIcon: Icon(Icons.lock_outline),
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: Colors.grey[200],
                                ),
                              )),
                          validator: (v) {
                            return v.trim().length > 0 ? null : '';
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: FlatButton(
                            color: Colors.blue,
                            highlightColor: Colors.blue[700],
                            child: Text('登录',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            onPressed: () async {
                              dynamic res = await Net.Login({'Username': 'admin', 'Password': '123123'});
                              if (res['code'] == 0) {
                                String _token = res['data'];
                                print('_token: $_token');

                                Routes.push(context, "/home");
                              }
                            },
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              child: Text('什么是账号？', style: TextStyle(fontSize: 16, color: Colors.grey)),
                            ),
                            GestureDetector(
                              child: Text('忘记密码？', style: TextStyle(fontSize: 16, color: Colors.grey)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              child: Text('仅服务于内部研究人员使用，账号开通请联系工作人员', style: TextStyle(color: Colors.grey, fontSize: 12)),
            )
          ],
        ),
      ),
    );
  }
}
