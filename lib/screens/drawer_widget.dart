import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {

  Function drawerAction;
  static int CATEGORY_NUMBER=1;
  static int SETTING_NUMBER=2;
  DrawerWidget(this.drawerAction);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*.80,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 60),
            color: Colors.green,
          ),
          InkWell(
              onTap: (){

                drawerAction(CATEGORY_NUMBER);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Categories'),
              )),
          InkWell(
              onTap: (){
                drawerAction(SETTING_NUMBER);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Settings'),
              )),
        ],
      ),
    );
  }
}
