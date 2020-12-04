import 'package:flutter/material.dart';
import '../../const/const.dart';

class CategoryScroll extends StatefulWidget {
  String categoryName;
  final categories=category;
  String index;
  Function change;
  CategoryScroll({this.index,this.change});

  @override
  _CategoryScrollState createState() => _CategoryScrollState();
}

class _CategoryScrollState extends State<CategoryScroll> {
  int selected = 0;
  String val;
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(left: 15,bottom: 10),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,i)=>GestureDetector(
          onTap:
              (){
            widget.change(widget.categories[i]);
            setState(() {
              widget.change(widget.categories[i]);
              selected=i;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: i == selected? Colors.cyan.withOpacity(.4):Colors.transparent,
                borderRadius: BorderRadius.circular(11)
            ),
            child: Text(widget.categories[i].toString() ,style: TextStyle(
                color: Colors.black,
              fontSize:15,
              fontWeight: FontWeight.w500
            ),),
          ),
        ),
        itemCount: widget.categories.length,
      ),
    );
  }
}
