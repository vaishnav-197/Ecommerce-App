import 'package:flutter/material.dart';
import '../itemDashView.dart';


class CategoryItemView extends StatefulWidget {
  int code;
  CategoryItemView({this.code});

  @override
  _CategoryItemViewState createState() => _CategoryItemViewState();
}

class _CategoryItemViewState extends State<CategoryItemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25,top: 10),
      height: MediaQuery.of(context).size.height*.25,
      child: ListView.builder(itemBuilder:(context,index)=>ItemDashView(code: widget.code,),itemCount: 5,scrollDirection: Axis.horizontal,),
    );
  }
}
