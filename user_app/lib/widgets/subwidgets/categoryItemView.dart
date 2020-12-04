import 'package:flutter/material.dart';
import 'itemDashView.dart';
import '../../services/dashboardItems.dart';


class CategoryItemView extends StatefulWidget {

  String token;
  List<Product> products;

  CategoryItemView({this.token,this.products});

  @override
  _CategoryItemViewState createState() => _CategoryItemViewState();
}

class _CategoryItemViewState extends State<CategoryItemView> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25,top: 10),
      height: MediaQuery.of(context).size.height*.25,
      child: ListView.builder(itemBuilder:(context,index)=>GestureDetector(
          child: ItemDashView(product:widget.products[index],),
      onTap: (){
            print('Ready to navigate');
      },
      ),
        itemCount: widget.products.length,
        scrollDirection: Axis.horizontal,),
    );
  }
}
