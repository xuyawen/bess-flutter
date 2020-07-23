import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:bess/widgets/bottom_sheet.dart';
import 'package:bess/common/net.dart';
import 'package:bess/utils/util.dart';
import 'package:bess/event/event_bus.dart';
import 'package:bess/common/global.dart';
import 'package:bess/utils/connect_blue.dart';
// import 'package:bess/blocs/user_bloc.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  EventBus bus = EventBus();
  PanelController panel = new PanelController();
  List patRecordList = List();
  Map<String, dynamic> userInfo = Global.getUserData();
  bool hasDevice = false;
  bool isConnectBle = false;
  Map<String, dynamic> currentDevice = Map();
  List deviceList = List();

  @override
  void initState() {
    super.initState();
    initAsync();
    bus.on('changePat', (arg) {
      getRecordList(arg["ID"]);
      setState(() {
        userInfo["Patient"] = arg;
        Global.saveUserData(userInfo);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    bus.off('changePat');
  }

  void initAsync() {
    int patId = userInfo["Patient"]["ID"];
    getRecordList(patId);
    deviceList.add(userInfo["Device"]);
  }

  void getRecordList(patId) async {
    List recordList = List();
    dynamic res = await Net.getRecordList(patId);
    if (res['code'] == 0) {
      Object _data = res['data']['list'];
      for (var item in _data) {
        String key = item['UpdatedAt'].substring(0, 10);
        var index = recordList.indexWhere((e) => e['date'] == key);
        if (index != -1) {
          recordList[index]['list'].add(item);
        } else {
          Map<String, dynamic> mapData = Map();
          List list = List();
          list.add(item);
          mapData['list'] = list;
          mapData['date'] = key;
          recordList.add(mapData);
        }
      }
      setState(() {
        patRecordList = recordList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final bloc = BlocProvider.of(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SlidingUpPanel(
        slideDirection: SlideDirection.DOWN,
        backdropEnabled: true,
        backdropColor: Colors.black,
        backdropOpacity: 0.5,
        controller: panel,
        minHeight: 0,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.0),
          bottomRight: Radius.circular(24.0),
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            // header detail
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                //   image: DecorationImage(
                //   image: AssetImage("images/wellcome.jpg"),
                //   fit: BoxFit.cover,
                // ),
              ),
              padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: Column(
                children: <Widget>[
                  Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 8,
                              children: <Widget>[
                                Text('${userInfo["Patient"]["Name"]}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18)),
                                Icon(
                                    userInfo["Patient"]['Sex'] == 1
                                        ? Icons.person
                                        : Icons.person,
                                    color: userInfo["Patient"]['Sex'] == 1
                                        ? Colors.white
                                        : Colors.pinkAccent),
                                Text(
                                    '${getAge(userInfo["Patient"]["Birthday"])}岁',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            Text('病历号：${userInfo["Patient"]["RecordNumber"]}',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          child: GestureDetector(
                            onTap: () {
                              // bloc.setUserData(userInfo);
                              bottomSheet(context);
                            },
                            child:
                                Icon(Icons.switch_camera, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  hasDevice ? Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Wrap(
                                spacing: 10.0,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: <Widget>[
                                  Text(currentDevice["Name"]),
                                  Offstage(
                                    offstage: !isConnectBle,
                                    child: Icon(Icons.check_circle,
                                        size: 15, color: Colors.blue),
                                  ),
                                  Text(isConnectBle ? '准备就绪' : '正在连接',
                                      style: TextStyle(color: Colors.blue)),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Text(currentDevice["Mac"],
                                    style: TextStyle(color: Colors.grey)),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Wrap(
                                children: <Widget>[
                                  Icon(Icons.bluetooth_audio,
                                      size: 15, color: Colors.blue),
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Padding(
                                      padding: EdgeInsets.all(7),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Icon(Icons.headset_off,
                                                  size: 15, color: Colors.red),
                                              Text('100',
                                                  style: TextStyle(
                                                      color: Colors.blue))
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Icon(Icons.battery_full,
                                                  size: 15, color: Colors.blue),
                                              Text('87',
                                                  style: TextStyle(
                                                      color: Colors.blue))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0xFFbfe9f0),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                      color: const Color(0xFFe6f4ff),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ) : Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.only(top: 30, bottom: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        panel.open();
                      },
                      child: Center(
                        child: Wrap(
                          spacing: 10,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: <Widget>[
                            Icon(Icons.add_circle_outline, color: Colors.blue),
                            Text("请添加听诊器设备", style: TextStyle(color: Colors.blue, fontSize: 18))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // main detal
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                Widget>[
              SizedBox(
                height: 470,
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: patRecordList.isNotEmpty
                      ? ListView.builder(
                          itemCount: patRecordList.length,
                          itemBuilder: (context, index) {
                            return StickyHeader(
                              header: Container(
                                height: 50.0,
                                color: Colors.grey[50],
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  patRecordList[index]['date'],
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                              content: Container(
                                margin: EdgeInsets.only(left: 15, right: 15),
                                child: Column(
                                  children: _buildSlidable(
                                      patRecordList[index]['list']),
                                ),
                              ),
                            );
                          })
                      : Center(child: Text('暂无数据')),
                ),
              ),
            ]),
          ],
        )),
        panel: Container(
          padding: EdgeInsets.only(top: 35),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60,
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      flex: 9,
                      child: ListTile(
                        title: Text('设备管理 （${deviceList.length}）',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        subtitle: Text('智能电子听诊器'),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          panel.close();
                        },
                        child: Icon(Icons.close, size: 30),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 328,
                child: ListView.builder(
                  itemCount: deviceList.length,
                  padding: EdgeInsets.only(top: 10),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Blue.getDrive();
                        setState(() {
                          currentDevice = deviceList[index];
                          // hasDevice = true;
                          panel.close();
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 18, right: 18),
                        padding: EdgeInsets.only(
                            top: 25, bottom: 25, left: 18, right: 18),
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
                        child: Flex(
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
                              flex: 7,
                              child: Container(
                                width: 50,
                                height: 50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(deviceList[index]["Name"],
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    Padding(
                                      padding: EdgeInsets.only(top: 7),
                                      child: Text(deviceList[index]["Mac"]),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 50,
                                height: 50,
                                child: Icon(Icons.chevron_right),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Wrap(
                  spacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.vertical,
                  children: <Widget>[
                    Text('如需添加新的听诊器', style: TextStyle(color: Colors.grey)),
                    Text('请在蓝牙设置中配对设备', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 滑动组件
  List<Widget> _buildSlidable(List group) {
    return group.map((item) {
      return Slidable(
        actionPane: SlidableStrechActionPane(),
        actionExtentRatio: 0.25,
        child: ListItem(
          title: item['Position'],
          duration: item['Duration'],
          time: item['UpdatedAt'],
          type: item['Type'],
          panel: panel,
        ),
        secondaryActions: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(8), left: Radius.circular(8)),
            child: SizedBox(
              height: 77,
              child: IconSlideAction(
                color: const Color(0xFFf75d3c),
                icon: Icons.delete,
                closeOnTap: false,
                onTap: () {
                  return showDialog<bool>(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('提示？'),
                          content: Text('确定删除该条记录？'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('取消'),
                              onPressed: () => Navigator.of(context).pop(false),
                            ),
                            FlatButton(
                              child: Text('确定'),
                              onPressed: () => Navigator.of(context).pop(true),
                            ),
                          ],
                        );
                      });
                },
              ),
            ),
          ),
        ],
      );
    }).toList();
  }
}

// 滑动项容器
class ListItem extends StatelessWidget {
  final String title;
  final int duration;
  final String time;
  final int type;
  final PanelController panel;

  const ListItem(
      {Key key, this.title, this.panel, this.duration, this.time, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Slidable.of(context).close();
      },
      child: Container(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        padding: EdgeInsets.only(top: 18, bottom: 18),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              //阴影
              BoxShadow(
                  color: Colors.grey, offset: Offset(0.1, 0.1), blurRadius: 4.0)
            ]),
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: CircleAvatar(
                backgroundColor: Colors.indigoAccent,
                child: Icon(Icons.brightness_high),
                foregroundColor: Colors.white,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(this.time.substring(10, 16),
                  style: TextStyle(fontSize: 17)),
            ),
            Expanded(
              flex: 2,
              child: Text(title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              flex: 1,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  Text(this.duration.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(' s', style: TextStyle())
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  panel.open();
                },
                child: Icon(Icons.chevron_right),
              ),
            )
          ],
        ),
      ),
    );
  }
}
