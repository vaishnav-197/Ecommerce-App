import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:user_app/screens/signup.dart';

import 'package:user_app/services/authenticate.dart';
import 'package:user_app/services/dashboardItems.dart';
import 'dashBoard.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name, password, token;
  final _formKey = GlobalKey<FormState>();
  bool _isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:_isloading ? Center(child: CircularProgressIndicator(),): Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 150),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Container(
                        width: 8.5 * (MediaQuery.of(context).size.width / 10),
                        margin: EdgeInsets.only(top: 60),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, 0.2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: TextFormField(
                                // validator: (value) =>
                                //     !EmailValidator.validate(value, true)
                                //         ? 'Please enter registered email'
                                //         : null,
                                validator: (value) =>
                                    value.isEmpty ? 'Enter your name' : null,
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (val) {
                                  name = val;
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Name",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              // decoration: BoxDecoration(
                              //     border: Border(
                              //         bottom: BorderSide(color: Colors.grey[200]))),
                              child: TextFormField(
                                obscureText: true,
                                onChanged: (val) {
                                  password = val;
                                },
                                validator: (value) => value.isEmpty
                                    ? 'Enter your password'
                                    : null,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 1.4 * (MediaQuery.of(context).size.height / 20),
                  width: 8.5 * (MediaQuery.of(context).size.width / 10),
                  margin: EdgeInsets.only(bottom: 20),
                  child: RaisedButton(
                    elevation: 5.0,
                    color: Color.fromRGBO(40, 199, 237, 1.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        print(name);
                        print(password);

                        AuthService().login(name, password).then((val) {
                          if (val.data['success']) {
                            token = val.data['token'];
                            setState(() {
                              _isloading=true;
                            });
                           /* Fluttertoast.showToast(
                                msg: 'Authenticated',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);*/
                           DashItems().dashproduct(token).then((check){
                             if(check.data["success"]){
                               setState(() {
                                 _isloading=false;
                               });

                               Navigator.push(context, MaterialPageRoute(builder: (context){
                                 List<Product> prod = DashItems().getprod(check);

                                 return(DashBoard(token: token,response: check,products: prod,));
                               },));
                             }else{
                               setState(() {
                                 _isloading=false;
                               });
                               print('error');
                             }
                           });

                          }
                        });

                     /*   AuthService().dash(token).then((val) {
                          Fluttertoast.showToast(
                              msg: val.data['msg'],
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.blue,
                              textColor: Colors.white,
                              fontSize: 16.0);
//<<<<<<< HEAD


                      });



                      AuthService().dash(token).then((val) {
                        Fluttertoast.showToast(
                            msg: val.data['msg'],
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });

                      */
    }

                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 40,
                        // letterSpacing: 1.8,
                        color: Colors.white,
                      ),
                    )
                  ),

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return SignUpPage();
                          }),
                        );
                      },
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "Don't have an account?",
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: MediaQuery.of(context).size.height / 60,
                            ),
                          ),
                          TextSpan(
                            text: " Sign Up!",
                            style: TextStyle(
                              color: Colors.lightBlue,
                              fontSize: MediaQuery.of(context).size.height / 60,
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
