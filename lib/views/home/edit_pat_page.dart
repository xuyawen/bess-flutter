import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditPatPage extends StatefulWidget {
  _EditPatPage createState() => _EditPatPage();
}

class _EditPatPage extends State<EditPatPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _qrcodeController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("编辑信息", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 50),
              alignment: Alignment.centerLeft,
              child: Text('患者的基本信息, 请务必保证资料的真实性。',
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
            ),
            Container(
              padding: EdgeInsets.only(left: 90, right: 90),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Wrap(
                      spacing: 8,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      children: <Widget>[
                        Icon(Icons.account_circle,
                            size: 50, color: Colors.pinkAccent),
                        Text('女',
                            style: TextStyle(
                                color: Colors.pinkAccent, fontSize: 20))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Wrap(
                      spacing: 8,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      children: <Widget>[
                        Icon(Icons.account_circle,
                            size: 50, color: Colors.blue),
                        Text('男',
                            style: TextStyle(color: Colors.blue, fontSize: 20))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _nameController,
                      decoration:
                          InputDecoration(labelText: '姓名', hintText: '请输入姓名'),
                      validator: (v) {
                        return v.trim().length > 0 ? null : '姓名不能为空';
                      },
                    ),
                    TextFormField(
                      controller: _qrcodeController,
                      decoration: InputDecoration(
                          labelText: '病历号',
                          suffixIcon: Icon(Icons.settings_overscan),
                          hintText: '请输入病历号'),
                      validator: (v) {
                        return v.trim().length > 0 ? null : '病历号不能为空';
                      },
                    ),
                    TextFormField(
                      controller: _ageController,
                      decoration: InputDecoration(
                          labelText: '年龄', hintText: '请选择出生年月日'),
                      validator: (v) {
                        if (v.trim().length > 0) {
                          return null;
                        } else {
                          return '年龄不能为空';
                        }
                      },
                    )
                  ],
                ),
              ),
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
                  child: Text('确定',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
