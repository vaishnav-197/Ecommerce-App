import 'package:flutter/material.dart';

class ItemDashView extends StatelessWidget {
  int code;
  ItemDashView({this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left:5,right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 40,
          color: code==0?Colors.cyan:Colors.blueGrey,
          width: 150,
        ),


      ),
    );
  }
}
