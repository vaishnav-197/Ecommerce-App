import 'package:flutter/material.dart';
import 'package:user_app/services/dashboardItems.dart';

class ItemDashView extends StatelessWidget {

  Product product;

  ItemDashView({this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.only(left:5,right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
            color: Colors.white,
        ),
        height: 40,
        width: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child:FittedBox(
              fit: BoxFit.scaleDown,
              child: Image.network(product.imgurl,)),
        ),
      ),
    );
  }
}
