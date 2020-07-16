import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultAuscultate extends StatefulWidget {
  @override
  _ResultAuscultate createState() => _ResultAuscultate();
}

class _ResultAuscultate extends State<ResultAuscultate> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("听诊结果", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(20),
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
                    flex: 9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Wrap(
                          spacing: 8,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: <Widget>[
                            Text('赵磊磊'),
                            Icon(Icons.person),
                            Text('6岁')
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text('病历号：100100100001'),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.swap_horiz),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        Icon(Icons.favorite, color: Colors.red),
                        Container(
                          height: 20,
                          child: VerticalDivider(
                            color: Colors.grey,
                          ),
                        ),
                        Text('肺动脉瓣',
                            style:
                                TextStyle(fontSize: 18, color: Colors.black54))
                      ],
                    ),
                  ),
                  Text('心率：34', style: TextStyle(fontSize: 18))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              height: 230,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    //阴影
                    BoxShadow(
                      color: Colors.transparent,
                    )
                  ]),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: <Widget>[
                  Icon(Icons.play_circle_outline, color: Colors.blue, size: 35),
                  Expanded(
                    child: Slider(
                      value: 30,
                      max: 100,
                      onChanged: (val) {},
                    ),
                  ),
                  Text('00:30', style: TextStyle(color: Colors.blue))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('症状：', style: TextStyle(fontSize: 20)),
                  Expanded(
                    child: Wrap(
                      spacing: 10,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 0.5),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular((5.0))),
                          child: Text('二尖瓣狭窄'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((15.0)),
                color: Colors.blue,
              ),
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: FlatButton(
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  child: Text('保存录音',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {},
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Align(
                child: Text('保存为临时听诊', style: TextStyle(fontSize: 20, color: Colors.blue)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
