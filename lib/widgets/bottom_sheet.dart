import 'package:flutter/material.dart';
import 'package:bess/routes/routers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:bess/utils/util.dart';
import 'package:bess/event/event_bus.dart';
import 'package:bess/common/global.dart';

Future<int> bottomSheet(BuildContext context, patList) async {
  final prefs = await SharedPreferences.getInstance();
  Map<String, dynamic> userInfoState = jsonDecode(prefs.getString('_userData'));

  showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20))),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return _sheetWidget(bc, patList, userInfoState);
      });
}

Widget _sheetWidget(context, List patList, userInfo) {
  EventBus bus = EventBus();

  void switchPat(index, context) async {
    userInfo["Patient"] = patList[index];
//    Global.saveUserData(userInfo);
    bus.emit('changePat', patList[index]);
    Navigator.of(context).pop();
  }

  void editPat() {
    int index = patList.indexWhere((e) => e["ID"] == userInfo["Patient"]["ID"]);
    print(patList[index]);
    Routes.push(context, "/edit-pat/edit/${patList[index]["UID"]}");
  }

  return SizedBox(
    height: 600,
    child: Container(
      padding: EdgeInsets.only(top: 29.0),
      child: Column(
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 60,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text('切换患者', style: TextStyle(fontSize: 20)),
                ),
              ),
              Expanded(
                flex: 40,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.close),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 50, maxWidth: 360),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 3.0, horizontal: 10.0),
                  hintText: '输入姓名、病历号搜索',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                onChanged: (val) {
                  print(val);
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 20, top: 10),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Wrap(
                        spacing: 10,
                        children: <Widget>[
                          Text(
                              '${userInfo != null ? '${userInfo["Patient"]["Name"]}' : ''}'),
                          Icon(Icons.person,
                              color: userInfo["Patient"]["Sex"] == 1
                                  ? Colors.blue
                                  : Colors.pinkAccent),
                          Text('${getAge(userInfo["Patient"]["Birthday"])}岁'),
                          Text('(当前患者)',
                              style: TextStyle(color: Colors.yellow)),
                        ],
                      ),
                      Text(
                          '病历号：${userInfo != null ? '${userInfo["Patient"]["RecordNumber"]}' : ''}')
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    child: Text('编辑信息', style: TextStyle(color: Colors.blue)),
                    onTap: editPat,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 370,
            child: ListView.builder(
              itemCount: patList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => switchPat(index, context),
                  child: Container(
                    height: 70,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          //阴影
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.1, 0.1),
                              blurRadius: 4.0)
                        ]),
                    margin: EdgeInsets.only(
                        top: index == 0 ? 10 : 0,
                        bottom: 10,
                        left: 20,
                        right: 20),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Wrap(
                                spacing: 10,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: <Widget>[
                                  Text(patList[index]['Name'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                  //                                Icon(Icons.person),
                                  Icon(
                                      patList[index]['Sex'] == 1
                                          ? Icons.person
                                          : Icons.person,
                                      color: patList[index]['Sex'] == 1
                                          ? Colors.blue
                                          : Colors.pinkAccent),
                                  Text(
                                      '${getAge(patList[index]["Birthday"])}岁'),
                                ],
                              ),
                              Text(patList[index]['RecordNumber'])
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () {},
                            child: Wrap(
                              children: <Widget>[
                                Text('${patList[index]['RecordCount']}次听诊记录',
                                    style: TextStyle(color: Colors.grey)),
                                Icon(Icons.chevron_right, color: Colors.grey)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              //阴影
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 0.5,
                blurRadius: .5,
                offset: Offset(0, -1.5),
              )
            ]),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Routes.push(context, '/edit-pat/add/0');
                    },
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: <Widget>[
                        Icon(Icons.add_circle_outline, color: Colors.blue),
                        Text('添加一个患者', style: TextStyle(color: Colors.blue))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      Icon(Icons.folder_open, color: Colors.yellow),
                      Text('临时听诊', style: TextStyle(color: Colors.yellow))
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
