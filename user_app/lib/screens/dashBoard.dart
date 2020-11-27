import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/categorySelect.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 100,
        elevation: 0,
        backgroundColor: Colors.white,

        leading: Container(
            margin:EdgeInsets.only(left: 20)
            ,child: Icon(Icons.sort,color: Colors.cyan,size: 35,)),
        actions: <Widget>[

          Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(Icons.shopping_cart,color: Colors.cyan,size: 30,))
        ],



      ),
      body:SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 1,
                child: Container(
                  color: Colors.black12,
                  margin: EdgeInsets.only(left: 10,right: 10),
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height*.020,
                ),

              CategorySelect()
            ],
          ),
        ),
      )
    );
  }
}
