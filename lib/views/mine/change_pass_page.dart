import 'package:flutter/material.dart';

class ChangePassPage extends StatefulWidget {
  @override
  _ChangePassPage createState() => _ChangePassPage();
}

class _ChangePassPage extends State<ChangePassPage> {
  TextEditingController _oldPassController = TextEditingController();
  TextEditingController _newOnePassController = TextEditingController();
  TextEditingController _newTwoPassController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("修改密码", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              height: 80,
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Colors.grey[100],
                        width: 2,
                        style: BorderStyle.solid)),
              ),
              child: Wrap(
                spacing: 15,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  Text('登录账号',
                      style: TextStyle(fontSize: 20, color: Colors.grey[500])),
                  Text('1999999999999',
                      style: TextStyle(fontSize: 20, color: Colors.grey[500])),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _oldPassController,
                      decoration:
                          InputDecoration(labelText: '原密码', hintText: '请输入原密码'),
                      validator: (v) {
                        return v.trim().length > 0 ? null : '原密码不能为空';
                      },
                    ),
                    TextFormField(
                      controller: _newOnePassController,
                      decoration:
                          InputDecoration(labelText: '新密码', hintText: '请输入新密码'),
                      validator: (v) {
                        return v.trim().length > 0 ? null : '新密码不能为空';
                      },
                    ),
                    TextFormField(
                      controller: _newTwoPassController,
                      decoration: InputDecoration(
                          labelText: '确认密码', hintText: '请再次输入新密码'),
                      validator: (v) {
                        if (v.trim().length > 0) {
                          return null;
                        } else {
                          return '请再次输入新密码';
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, bottom: 15),
              child: Text('密码必须是6-16位的数字，字母组合'),
            ),
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Text('忘记原密码？',
                  style: TextStyle(fontSize: 20, color: Colors.blue)),
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(top: 50),
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: FlatButton(
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  child: Text('确认',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
