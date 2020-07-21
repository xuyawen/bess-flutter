import 'package:bess/common/net.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:bess/event/event_bus.dart';

import 'package:bess/utils/util.dart';

class EditPatPage extends StatefulWidget {
  String type;
  String uid;
  EditPatPage(this.type, this.uid);
  _EditPatPage createState() => _EditPatPage();
}

class _EditPatPage extends State<EditPatPage> {
  int sex = 0;
  EventBus bus = EventBus();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _qrcodeController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();
  Map<String, dynamic> userInfo;

  void addPat() async {
    Map<String, dynamic> patInfo = {
      "Uid": getUid(),
      "Name": _nameController.text,
      "Sex": sex,
      "Birthday": _ageController.text,
      "RecordNumber": _qrcodeController.text,
    };
    dynamic res = await Net.addPat(patInfo);
    if (res['code'] == 0) {
      print('addPat: $res');
      Navigator.of(context).pop();
    } else {
      print('addPat: $res');
    }
  }

  void editPat() async {
    Map<String, dynamic> patInfo = {
      "UID": widget.uid != null ? widget.uid : "2020072118563355",
      "ID": userInfo["Patient"]["ID"],
      "Name": _nameController.text,
      "Sex": sex,
      "Birthday": _ageController.text,
      "RecordNumber": _qrcodeController.text,
    };
    print('patInfo: $patInfo');
    dynamic res = await Net.updatePat(patInfo);
    if (res['code'] == 0) {
      print('editPat: $patInfo');
      bus.emit('changePat', patInfo);
      Navigator.of(context).pop();
    } else {
      print('editPat: $res');
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.type == 'edit') initAsync();
  }

  void initAsync() async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> userInfoState =
    jsonDecode(prefs.getString('_userInfo'));
    _nameController.text = userInfoState["Patient"]["Name"];
    _qrcodeController.text = userInfoState["Patient"]["RecordNumber"];
    _ageController.text = userInfoState["Patient"]["Birthday"];
    setState(() {
      sex = userInfoState["Patient"]["Sex"];
      userInfo = userInfoState;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(widget.type == "edit" ? "编辑信息" : "添加患者",
            style: TextStyle(color: Colors.black)),
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
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                    widget.type == "edit"
                        ? '患者的基本信息, 请务必保证资料的真实性。'
                        : '请填写新增患者的基本信息。系统将建立专属的个人档案，档案建立后不可删除，请务必保证资料的真实性。',
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 90, right: 90),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          sex = 2;
                        });
                      },
                      child: Wrap(
                        spacing: 8,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.center,
                        children: <Widget>[
                          Icon(Icons.account_circle,
                              size: 50,
                              color:
                                  sex == 2 ? Colors.pinkAccent : Colors.grey),
                          Text('女',
                              style: TextStyle(
                                  color: Colors.pinkAccent, fontSize: 20))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          sex = 1;
                        });
                      },
                      child: Wrap(
                        spacing: 8,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.center,
                        children: <Widget>[
                          Icon(Icons.account_circle,
                              size: 50,
                              color: sex == 1 ? Colors.blue : Colors.grey),
                          Text('男',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 20))
                        ],
                      ),
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
                    ),
                    TextFormField(
                      controller: _qrcodeController,
                      decoration: InputDecoration(
                          labelText: '病历号',
                          suffixIcon: Icon(Icons.settings_overscan),
                          hintText: '请输入病历号'),
                    ),
                    TextFormField(
                      onTap: () {
                        DatePicker.showDatePicker(
                          context,
                          pickerTheme: DateTimePickerTheme(
                            showTitle: true,
                            confirm:
                                Text('确定', style: TextStyle(color: Colors.red)),
                            cancel: Text('取消',
                                style: TextStyle(color: Colors.cyan)),
                          ),
                          initialDateTime: DateTime.now(), //当前日期
                          dateFormat: 'yyyy-MMMM-dd', //显示格式
                          locale: DateTimePickerLocale
                              .zh_cn, //语言 默认DateTimePickerLocale.en_us
                          onConfirm: (dateTime, List<int> index) {
                            //确定的时候
                            setState(() {
                              _ageController.text =
                                  dateTime.toString().split(" ")[0];
                            });
                          },
                        );
                      },
                      readOnly: true,
                      controller: _ageController,
                      decoration: InputDecoration(
                          labelText: '年龄', hintText: '请选择出生年月日'),
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
                  onPressed: () => widget.type == 'add' ? addPat() : editPat(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
