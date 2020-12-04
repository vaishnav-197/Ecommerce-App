import 'package:flutter/material.dart';
import 'package:user_app/screens/cart/Cart.dart';

import '../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 8.5 * (MediaQuery.of(context).size.width / 10),
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFF5F6F9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(demoCarts[0].product.images[0]),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
