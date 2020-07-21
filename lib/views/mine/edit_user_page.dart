import 'package:flutter/material.dart';
import 'package:bess/common/net.dart';
import 'package:bess/event/event_bus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class EditUserPage extends StatefulWidget {
  _EditUserPage createState() => _EditUserPage();
}

class _EditUserPage extends State<EditUserPage> {
  EventBus bus = EventBus();
  SharedPreferences prefs;

  String _name = '';
  @override
  void initState() {
    initAsync();
    super.initState();
  }

  void initAsync() async {
    prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> userInfo = jsonDecode(prefs.getString('_userData'));
    setState(() {
      _name = userInfo["User"]["Name"];
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("编辑姓名", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              autofocus: true,
              controller: TextEditingController.fromValue(TextEditingValue(
              text: '${this._name == null ? "" : this._name}',  //判断keyword是否为空

              selection: TextSelection.fromPosition(// 保持光标在最后
                  TextPosition(
                  affinity: TextAffinity.downstream,
                  offset: '${this._name}'.length)))),
              onChanged: (val) {
                setState(() {
                  _name = val;
                });
              },
              decoration: InputDecoration(
                  labelText: "姓名",
                  hintText: "请输入姓名"
              )
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text('姓名仅支持2~8位中文汉字', style: TextStyle(color: Colors.grey[500])),
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(top: 300),
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: FlatButton(
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  child: Text('确认', style: TextStyle(color: Colors.white, fontSize: 20)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                  onPressed: updateUserName,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void updateUserName() async {
    var res = await Net.updateUserName(_name);
    if (res['code'] == 0) {
      Navigator.of(context).pop();
      bus.emit('changeUserName', _name);
    }
  }
}