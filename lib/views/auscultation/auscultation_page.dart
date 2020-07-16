import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../main_page.dart';
import 'temp_auscultate.dart';

class AuscultationPage extends StatefulWidget {
  @override
  _AuscultationPageState createState() => _AuscultationPageState();
}

class _AuscultationPageState extends State<AuscultationPage> {
  PanelController panel = PanelController();

  String _positionRadio = '';
  Set<String> _symptomSelects = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SlidingUpPanel(
          slideDirection: SlideDirection.UP,
          backdropEnabled: true,
          backdropColor: Colors.black,
          backdropOpacity: 0.5,
          controller: panel,
          maxHeight: 666,
          minHeight: 0,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
          body: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage("images/wellcome.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: _waitWidget(),
            ),
          ),
          panel: Container(
            child: PositionAndSymptom(),
          ),
        ),
      ),
    );
  }

  // 位置与症状
  Widget PositionAndSymptom() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            child: Text('位置与症状',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 10),
            child: Text('请选择听诊位置：',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Container(
            child: Wrap(
              children: <Widget>[
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    Radio(
                        value: '二尖瓣',
                        groupValue: _positionRadio,
                        onChanged: (val) {
                          setState(() {
                            _positionRadio = val;
                          });
                        }),
                    Text('二尖瓣', style: TextStyle(fontSize: 17))
                  ],
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    Radio(
                        value: '三尖瓣',
                        groupValue: _positionRadio,
                        onChanged: (val) {
                          setState(() {
                            _positionRadio = val;
                          });
                        }),
                    Text('三尖瓣', style: TextStyle(fontSize: 17))
                  ],
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    Radio(
                        value: 'v',
                        groupValue: _positionRadio,
                        onChanged: (val) {
                          setState(() {
                            _positionRadio = val;
                          });
                        }),
                    Text('肺动脉瓣', style: TextStyle(fontSize: 17))
                  ],
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    Radio(
                        value: '主瓣1',
                        groupValue: _positionRadio,
                        onChanged: (val) {
                          setState(() {
                            _positionRadio = val;
                          });
                        }),
                    Text('主瓣1', style: TextStyle(fontSize: 17))
                  ],
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    Radio(
                        value: '主瓣2',
                        groupValue: _positionRadio,
                        onChanged: (val) {
                          setState(() {
                            _positionRadio = val;
                          });
                        }),
                    Text('主瓣2', style: TextStyle(fontSize: 17))
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 10),
            child: Text('请选择症状：',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Container(
            child: Wrap(
              spacing: 8,
              children: <Widget>[
                ChoiceChip(
                  label: Text('正常'),
                  labelStyle: TextStyle(color: _symptomSelects.contains('正常') ? Colors.white : Colors.black),
                  labelPadding: EdgeInsets.fromLTRB(12, 2, 12, 2),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: _symptomSelects.contains('正常') ? Colors.transparent : Colors.black, width: 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  backgroundColor: Colors.white,
                  selected: _symptomSelects.contains('正常'),
                  selectedColor: Colors.blue,
                  onSelected: (val) {
                    setState(() {
                      if (_symptomSelects.contains('正常')) {
                        _symptomSelects.remove('正常');
                      } else {
                        _symptomSelects.add('正常');
                      }
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('房缺'),
                  labelPadding: EdgeInsets.fromLTRB(12, 2, 12, 2),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  backgroundColor: Colors.white,
                  selected: _symptomSelects.contains('房缺'),
                  selectedColor: Colors.yellow,
                  onSelected: (val) {
                    setState(() {
                      if (_symptomSelects.contains('房缺')) {
                        _symptomSelects.remove('房缺');
                      } else {
                        _symptomSelects.add('房缺');
                      }
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('室缺'),
                  labelPadding: EdgeInsets.fromLTRB(12, 2, 12, 2),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  backgroundColor: Colors.white,
                  selected: _symptomSelects.contains('室缺'),
                  selectedColor: Colors.yellow,
                  onSelected: (val) {
                    setState(() {
                      if (_symptomSelects.contains('室缺')) {
                        _symptomSelects.remove('室缺');
                      } else {
                        _symptomSelects.add('室缺');
                      }
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('室颤'),
                  labelPadding: EdgeInsets.fromLTRB(12, 2, 12, 2),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  backgroundColor: Colors.white,
                  selected: _symptomSelects.contains('室颤'),
                  selectedColor: Colors.yellow,
                  onSelected: (val) {
                    setState(() {
                      if (_symptomSelects.contains('室颤')) {
                        _symptomSelects.remove('室颤');
                      } else {
                        _symptomSelects.add('室颤');
                      }
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('主动脉瓣狭窄'),
                  labelPadding: EdgeInsets.fromLTRB(12, 2, 12, 2),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  backgroundColor: Colors.white,
                  selected: _symptomSelects.contains('主动脉瓣狭窄'),
                  selectedColor: Colors.yellow,
                  onSelected: (val) {
                    setState(() {
                      if (_symptomSelects.contains('主动脉瓣狭窄')) {
                        _symptomSelects.remove('主动脉瓣狭窄');
                      } else {
                        _symptomSelects.add('主动脉瓣狭窄');
                      }
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 15),
            child: TextField(
                maxLines: 8,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: "输入其它类型",
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 0.5)
                  ),
                )),
          ),
          Container(
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
                child: Text('确定',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }

  // 等待连接
  Widget _waitWidget() {
    return GestureDetector(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 40,
            left: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MainPage()));
              },
              child: Icon(
                Icons.close,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 10,
            child: GestureDetector(
              child: Text('临时听诊记录',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              onTap: () {
                panel.open();
              },
            ),
          ),
          Positioned(
            top: 180,
            child: Text('晚上好，王医生',
                style: TextStyle(color: Colors.white, fontSize: 25)),
          ),
          Positioned(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => TempAuscultate()));
              },
              child: Image.asset("images/hearing.png", width: 120, height: 120),
            ),
          ),
          Positioned(
            bottom: 50,
            child: Text('长按听诊器“L”键，开始听诊',
                style: TextStyle(color: Colors.white, fontSize: 20)),
          )
        ],
      ),
    );
  }

  // 开始听诊
  Widget _startWidget() {
    return GestureDetector(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 40,
            left: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MainPage()));
              },
              child: Icon(
                Icons.close,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 60,
            child: Wrap(
              spacing: 6,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                Text('赵磊磊',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                Text('5岁', style: TextStyle(fontSize: 18, color: Colors.white))
              ],
            ),
          ),
          Positioned(
            top: 180,
            child: Text('听诊过程中请勿随意移动听诊器',
                style: TextStyle(color: Colors.white, fontSize: 25)),
          ),
          Positioned(
            child: Image.asset("images/hearing.png", width: 120, height: 120),
          ),
          Positioned(
            bottom: 200,
            left: 20,
            child: Text('心率：--',
                style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
          Positioned(
            bottom: 200,
            right: 20,
            child: Text('00:14',
                style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
          Positioned(
            bottom: 150,
            child: Text('~~~~',
                style: TextStyle(color: Colors.white, fontSize: 20)),
          )
        ],
      ),
    );
  }
}
