import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../widgets/bottom_sheet.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   PanelController panel = new PanelController();

  // GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Text('韩磊磊', style: TextStyle(color: Colors.white, fontSize: 18)),
                                    Icon(Icons.person_outline, color: Colors.white, size: 20,),
                                    Text('6岁', style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                                Text('病历号：10010001001001', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              child: GestureDetector(
                                onTap: () async {
                                  var type = await bottomSheet(context);
                                  print('type: $type');
                                },
                                child: Icon(Icons.switch_camera, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
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
                                    children: <Widget>[
                                      Text('LD-DS-20'),
                                      Icon(Icons.check_circle, size: 15, color: Colors.blue),
                                      Text('准备就绪', style: TextStyle(color: Colors.blue)),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10.0),
                                    child: Text('f0:01:5b:0a:a5:5a', style: TextStyle(color: Colors.grey)),
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
                                      Icon(Icons.bluetooth_audio, size: 15, color: Colors.blue),
                                      Container(
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
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // main detal
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 573,
                        child: ListView(
                          padding: EdgeInsets.only(top: 0),
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 5, 10),
                              child: Text('昨天 7月13日', style: TextStyle(fontSize: 19)),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: _showSlidable(panel),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: _showSlidable(panel),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: _showSlidable(panel),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: _showSlidable(panel),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: _showSlidable(panel),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: _showSlidable(panel),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: _showSlidable(panel),
                            ),
                          ],
                        ),
                      ),
                    ]
                ),
              ],
            )
        ),
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
                        title: Text('设备管理 （2）', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                        subtitle: Text('智能电子听诊器'),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Icon(Icons.close, size: 30),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 328,
                child: ListView(
                  padding: EdgeInsets.only(top: 10),
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 18, right: 18),
                      padding: EdgeInsets.only(top: 25, bottom: 25, left: 18, right: 18),
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
                  ],
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
  Widget _showSlidable(PanelController panelController) {
    return Slidable(
      // key: Key('1'),
      actionPane: SlidableStrechActionPane(),
      actionExtentRatio: 0.25,
      child: ListItem(
        // key: key,
        title: '肺动脉瓣',
        panel: panelController,
      ),
      secondaryActions: <Widget>[
        ClipRRect(
          borderRadius: const BorderRadius.horizontal(right: Radius.circular(8), left: Radius.circular(8)),
          child: SizedBox(
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
                    }
                );
              },
            ),
          ),
        ),
      ],
    );
  }

}

// 滑动项容器
class ListItem extends StatelessWidget {
  final String title;
  final PanelController panel;

  const ListItem({Key key, this.title, this.panel}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Slidable.of(context).close();
      },
      child: Container(
        padding: EdgeInsets.only(top: 18, bottom: 18),
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
              flex: 1,
              child: CircleAvatar(
                backgroundColor: Colors.indigoAccent,
                child: Icon(Icons.brightness_high),
                foregroundColor: Colors.white,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text('14:25', style: TextStyle(fontSize: 17)),
            ),
            Expanded(
              flex: 2,
              child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              flex: 1,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  Text('36', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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