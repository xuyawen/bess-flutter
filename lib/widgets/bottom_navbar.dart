// import 'package:bess/components/each_view.dart';
import 'package:flutter/material.dart';
import '../views/home/home_page.dart';
import '../views/auscultation/auscultation_page.dart';
import '../views/mine/mine_page.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> _eachView;
  int _index = 0;

  @override
  void initState() {
    _eachView = List();
    _eachView..add(HomePage());
    _eachView..add(MinePage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 变换页面
      body: _eachView[_index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return AuscultationPage();
          }));
        },
        // tooltip: '添加',
        child: Icon(Icons.hearing, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        //工具栏比NavigationBar灵活
        color: Colors.lightBlue,
        //与fab融合
        //圆形缺口
        // shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              // padding: const EdgeInsets.all(10.0),
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 1;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
