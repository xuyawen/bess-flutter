import 'package:flutter/material.dart';
import 'home/home_page.dart';
import 'auscultation/auscultation_page.dart';
import 'mine/mine_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  PageController pageController;

  int _page = 0;

  String img = 'images/hearing.png';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            //Scaffold里面按照之前的写法body->PageView,bottomNavigationBar直接使用BottomNavigationBar
            Scaffold(
              body: PageView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[new HomePage(), null, new MinePage()],
                controller: pageController,
                onPageChanged: onPageChanged,
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), title: Text('首页')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.hearing), title: Text('听诊')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), title: Text('我的')),
                ],
                onTap: onTap,
                currentIndex: _page,
              ),
            ),
            //在整个界面的上层放一个FloatingActionButton 组件,位置在底部居中
            Align(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  height: 70,
                  width: 70,
                  child: FloatingActionButton(
                    elevation: 0,
                    highlightElevation: 0,
                    backgroundColor: Color(0x0067BFFF),
                    child: new Image.asset(img),
                    onPressed: onAuscultationPage,
                  ),
                ),
              ),
              alignment: Alignment.bottomCenter,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: this._page);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void onAuscultationPage() {
    setState(() {
      this._page = 1;
    });
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => new AuscultationPage()));
  }

  void onTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 1), curve: Curves.ease);
  }
}
