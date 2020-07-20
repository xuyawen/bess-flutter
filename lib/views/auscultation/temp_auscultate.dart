import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:bess/routes/routers.dart';
import 'package:bess/common/net.dart';


class TempAusculState extends StatefulWidget {
  @override
  _TempAusculState createState() => _TempAusculState();
}

class _TempAusculState extends State<TempAusculState> {

  List<dynamic> patRecordList = List();

  List data=[{
    "date":"昨天 4月23日",
    "group":[
      "A分组1","A分组1","A分组1","A分组1","A分组1","A分组1"
    ]
  },{
    "date":"4月13日 星期一",
    "group":[
      "B分组1","B分组1","B分组1","B分组1","B分组1","B分组1"
    ]
  },{
    "date":"4月14日 星期二",
    "group":[
      "C分组1","C分组1","C分组1","C分组1","C分组1","C分组1"
    ]
  },{
    "date":"4月14日 星期二",
    "group":[
      "D分组1","D分组1","D分组1","D分组1","D分组1","D分组1"
    ]
  },{
    "date":"4月14日 星期二",
    "group":[
      "E分组1","E分组1","E分组1","E分组1","E分组1","E分组1"
    ]
  }];

  @override
  void initState() {
    super.initState();
    initAsync();
  }

  void initAsync() async {
    List recordList = List();
    dynamic res = await Net.getTempRecordList();
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
      print(recordList);
      setState(() {
        patRecordList = recordList;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("临时听诊记录", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return StickyHeader(
              header: Container(
                height: 50.0,
                color: Colors.grey[50],
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: Text(data[index]['date'],
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              content: Column(
                children: buildGroup(data[index]['group']),
              ),
            );
          }
      ),
    );
  }

  List<Widget> buildGroup(List group){
    return group.map((item){
      return Container(
        margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
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
              child: Text(item, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                  Routes.push(context, "/result-auscultate");
                },
                child: Icon(Icons.chevron_right),
              ),
            )
          ],
        ),
      );
    }).toList();
  }
}