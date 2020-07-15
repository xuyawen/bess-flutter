import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<int> topSheet(BuildContext context) {
  showModalBottomSheet<int>(
      shape: RoundedRectangleBorder(borderRadius: const BorderRadius.vertical(top: Radius.circular(20))),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return _sheetWidget(bc);
      });
}


Widget _sheetWidget(context) {
  return Stack(
    children: <Widget>[
      Positioned(
        top: 0,
        child: SizedBox(
          height: 600,
          child: Container(
            padding: EdgeInsets.only(top: 20.0),
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
                            child: Icon(Icons.cancel),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: 50,
                        maxWidth: 360
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
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
                                Text('韩磊磊'),
                                Icon(Icons.person),
                                Text('6岁'),
                                Text('当前患者'),
                              ],
                            ),
                            Text('病历号：10010001001')
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          child: Text('编辑信息'),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 370,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 70,
                        padding: EdgeInsets.all(10),
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
                        margin: EdgeInsets.only(top: index == 0 ? 10 : 0, bottom: 10, left: 20, right: 20),
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
                                    children: <Widget>[
                                      Text('韩磊磊 - $index'),
                                      Icon(Icons.person),
                                      Text('$index岁'),
                                    ],
                                  ),
                                  Text('病历号：10010001001')
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: GestureDetector(
                                child: Wrap(
                                  children: <Widget>[
                                    Text('$index次听诊记录'),
                                    Icon(Icons.chevron_right)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [ //阴影
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 0.5,
                          blurRadius: .5,
                          offset: Offset(0, -1.5),
                        )
                      ]
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: <Widget>[
                            Icon(Icons.add_circle_outline),
                            Text('添加一个患者')
                          ],
                        ),
                      ),
                      Expanded(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: <Widget>[
                            Icon(Icons.folder_open),
                            Text('临时听诊')
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ],
  );
}
