import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/screens/cart/Cart.dart';
import 'package:user_app/screens/cart/product.dart';

import '../../size_config.dart';
import 'cart_item_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: demoCarts.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Dismissible(
          key: Key(demoCarts[index].product.id.toString()),
          direction: DismissDirection.endToStart,
          background: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Color(0xFFFFE6E6),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Spacer(),
                SvgPicture.asset("assets/Trash.svg"),
              ],
            ),
          ),
          onDismissed: (direction) {
            setState(() {
              demoCarts.removeAt(index);
            });
          },
          child: CartItemCard(
            cart: demoCarts[index],
          ),
        ),
      ),
    );
  }
}
