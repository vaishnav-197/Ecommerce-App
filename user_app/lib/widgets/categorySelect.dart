import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../const/const.dart';
import 'itemDashView.dart';
import 'subwidgets/categoryScroll.dart';
import 'subwidgets/categoryItemView.dart';

class CategorySelect extends StatefulWidget {





  @override

  int selectedCategory=0;
  _CategorySelectState createState() => _CategorySelectState();
}

class _CategorySelectState extends State<CategorySelect> {

   _categorychange(int val){

    setState(() {
      widget.selectedCategory=val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          CategoryScroll(index: widget.selectedCategory,change: _categorychange,),


          CategoryItemView(code: widget.selectedCategory,)
        ],

      ),
    );
  }
}
