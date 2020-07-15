import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  _AboutPage createState() => _AboutPage();
}

class _AboutPage extends State<AboutPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 80, bottom: 20),
                    child: Icon(Icons.dashboard, size: 70,),
                  ),
                  Text('理得医疗科技', style: TextStyle(fontSize: 20)),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text('Version 1.0.12'),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 65,
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey[100], width: 2, style: BorderStyle.solid)),
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          flex: 9,
                          child: Text('应用评价', style: TextStyle(fontSize: 18)),
                        ),
                        Expanded(
                          flex: 1,
                          child: Icon(Icons.chevron_right),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 65,
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey[100], width: 2, style: BorderStyle.solid)),
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          flex: 9,
                          child: Text('官方网站', style: TextStyle(fontSize: 18)),
                        ),
                        Expanded(
                          flex: 1,
                          child: Icon(Icons.chevron_right),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 65,
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey[100], width: 2, style: BorderStyle.solid)),
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          flex: 9,
                          child: Text('微信公众号', style: TextStyle(fontSize: 18)),
                        ),
                        Expanded(
                          flex: 1,
                          child: Icon(Icons.chevron_right),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 65,
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey[100], width: 2, style: BorderStyle.solid)),
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          flex: 9,
                          child: Text('检查更新', style: TextStyle(fontSize: 18)),
                        ),
                        Expanded(
                          flex: 1,
                          child: Icon(Icons.chevron_right),
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
    );
  }
}