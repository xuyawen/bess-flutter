import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/material.dart';

class ToutiaoDemo extends StatefulWidget {
  ToutiaoDemo({Key key}) : super(key: key);

  @override
  _ToutiaoDemoState createState() => _ToutiaoDemoState();
}

class _ToutiaoDemoState extends State<ToutiaoDemo> {
  PanelController panel = new PanelController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SlidingUpPanel(
        slideDirection: SlideDirection.DOWN,
        backdropEnabled: true,
        backdropColor: Colors.black,
        backdropOpacity: 0.5,
        controller:panel,
        minHeight: 0,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.0),
          bottomRight: Radius.circular(24.0),
        ),
        body: GestureDetector(
          child: new ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage("images/wellcome.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  showPanel();
                },
                child: Text('Tap', style: TextStyle(fontSize: 60),),
              ),
            ),
          ),
//          onTap: (){
//            panel.close();
//          }
        ),
        panel: Container(
          child: Center(
            child: Text("更换设备",style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.normal,decoration:TextDecoration.none)),
          ),
        ),
      ),
    );
  }

  void showPanel() {
//    panel.setPanelPosition(300);
    panel.open();
  }
}