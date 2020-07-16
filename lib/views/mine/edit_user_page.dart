import 'package:flutter/material.dart';

class EditUserPage extends StatefulWidget {
  _EditUserPage createState() => _EditUserPage();
}

class _EditUserPage extends State<EditUserPage> {
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
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
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