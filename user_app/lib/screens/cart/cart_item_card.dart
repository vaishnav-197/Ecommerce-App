import 'package:flutter/material.dart';

import 'Cart.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 2.5 * (MediaQuery.of(context).size.width / 10),
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                cart.product.images[0],
                height: 1.5 * (MediaQuery.of(context).size.width / 20),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 0.25 * (MediaQuery.of(context).size.height / 30),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.product.title,
              style: TextStyle(fontSize: 14, color: Colors.black),
              maxLines: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            Text.rich(TextSpan(
                text: "\$${cart.product.price}",
                style: TextStyle(color: Colors.amber),
                children: [
                  TextSpan(
                      text: "x${cart.numOfItems}",
                      style: TextStyle(color: Colors.grey))
                ]))
          ],
        )
      ],
    );
  }
}
