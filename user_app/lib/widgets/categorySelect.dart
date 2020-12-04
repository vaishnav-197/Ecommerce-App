import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../const/const.dart';
import 'subwidgets/itemDashView.dart';
import 'subwidgets/categoryScroll.dart';
import 'subwidgets/categoryItemView.dart';
import '../services/dashboardItems.dart';

class CategorySelect extends StatefulWidget {
  String token;
  Response response;
  List<Product> products;
  List<Product> selected=[];
  CategorySelect({this.token,this.response,this.products});
  String selectedCategory=category[0];



  @override


  _CategorySelectState createState() => _CategorySelectState();
}

class _CategorySelectState extends State<CategorySelect> {



   _categorychange(String cat){

    setState(() {
      widget.selectedCategory=cat;
      widget.selected=DashItems().getCatProducts(cat, widget.products);
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    widget.selected=widget.selected=DashItems().getCatProducts(widget.selectedCategory, widget.products);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          CategoryScroll(index: widget.selectedCategory,change: _categorychange),
          CategoryItemView(token:widget.token,products:widget.selected)
        ],

      ),
    );
  }
}
