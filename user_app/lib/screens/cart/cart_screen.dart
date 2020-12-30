import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:user_app/screens/cart/Cart.dart';
import 'package:user_app/screens/cart/body.dart';
import 'package:user_app/size_config.dart';

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
      bottomNavigationBar: CheckOutCard(),
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

class CheckOutCard extends StatelessWidget {
  const CheckOutCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          // vertical: 0. * (MediaQuery.of(context).size.width / 10),
          horizontal: 0 * (MediaQuery.of(context).size.width / 10)),
      // height: 174,
      decoration: BoxDecoration(color: Color.fromRGBO(225, 236, 239, 100),
          // borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -15),
                blurRadius: 20,
                color: Color(0xFFDADADA).withOpacity(0.15)),
          ]),
      child: Padding(
        padding:
            EdgeInsets.only(left: 1 * (MediaQuery.of(context).size.width / 10)),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // SizedBox(height: 1.5 * (MediaQuery.of(context).size.height / 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(TextSpan(text: "Total:\n", children: [
                    TextSpan(
                      text: "\$223.5",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    )
                  ])),
                  Container(
                    height: 1.4 * (MediaQuery.of(context).size.height / 20),
                    width: 5 * (MediaQuery.of(context).size.width / 10),
                    padding: EdgeInsets.only(right: 0),
                    child: FlatButton(
                        // elevation: 5.0,
                        padding: EdgeInsets.only(right: 0),
                        color: Color.fromRGBO(40, 199, 237, 1.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Check out',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 40,
                            // letterSpacing: 1.8,
                            color: Colors.white,
                          ),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
