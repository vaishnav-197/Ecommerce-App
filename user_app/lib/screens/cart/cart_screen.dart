import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:user_app/screens/cart/Cart.dart';
import 'package:user_app/screens/cart/body.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      // leading: IconButton(
      //   icon: Icon(
      //     Icons.keyboard_arrow_left,
      //     color: Colors.cyan,
      //   ),
      // onPressed: () {},
      // ),
      title: Center(
        child: Column(
          children: [
            Text(
              "Cart",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "${demoCarts.length} items",
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      ),
    );
  }
}
