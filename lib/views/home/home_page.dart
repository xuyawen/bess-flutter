import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../widgets/bottom_sheet.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  List<String> list = ['123', '456', '789', '101'];
  GlobalKey key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Scrollbar(
          child: SingleChildScrollView(
            child: Container(
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
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
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
                                        Icon(Icons.pregnant_woman, color: Colors.white),
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
                                      var type = await showSheet(context);
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
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 5, 0),
                            child: Text('昨天 7月13日', style: TextStyle(fontSize: 19)),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            child: _getSlidable(),
                          ),
                        ]
                    ),
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }

  _getRecord({String text, Key key}) {
    return GestureDetector(
      key: key,
      child: Text(text),
    );
  }

  _showSnackBar(String action){
    print('当前点击按钮：$action');
  }

  Widget _getSlidable() {
    return Slidable(
      key: Key('1'),
      actionPane: SlidableStrechActionPane(),
      actionExtentRatio: 0.2,
      child: ListItem(
        key: key,
        title: '左划更多',
      ),
      secondaryActions: <Widget>[//右侧按钮列表
        IconSlideAction(
          color: Colors.green,
          icon: Icons.edit,
          closeOnTap: false,
          onTap: (){
            Slidable.of(key.currentContext).close();
          },
        ),
        ClipRRect(
          borderRadius: const BorderRadius.horizontal(right: Radius.circular(8)),
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
      ],
    );
  }

}

class ListItem extends StatelessWidget {
  final String title;
  const ListItem({Key key,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Slidable.of(context).close();
      },
      child: Container(
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
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.indigoAccent,
            child: Text('A'),
            foregroundColor: Colors.white,
          ),
          title: Text(title),
          subtitle: Text('SlidableDrawerDelegate'),
        ),
      ),
    );
  }
}