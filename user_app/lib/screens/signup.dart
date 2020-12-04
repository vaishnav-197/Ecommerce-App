import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:user_app/screens/login.dart';
import 'package:user_app/services/authenticate.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String email, password, name, phone, token, password1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.cyan,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return LoginPage();
              }),
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 50),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 1.0 * (MediaQuery.of(context).size.height / 20),
                      width: 4 * (MediaQuery.of(context).size.width / 10),
                      margin: EdgeInsets.only(bottom: 10, left: 30, right: 10),
                      child: RaisedButton(
                        elevation: 5.0,
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () async {},
                        child: Text(
                          'Google',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 50,
                            // letterSpacing: 1.8,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 1.0 * (MediaQuery.of(context).size.height / 20),
                      width: 4 * (MediaQuery.of(context).size.width / 10),
                      margin: EdgeInsets.only(bottom: 10),
                      child: RaisedButton(
                        elevation: 5.0,
                        color: Colors.indigo,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () async {},
                        child: Text(
                          'Facebook',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 50,
                            // letterSpacing: 1.8,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Container(
                        width: 8.5 * (MediaQuery.of(context).size.width / 10),
                        margin: EdgeInsets.only(top: 5),
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
                                onChanged: (val) {
                                  name = val;
                                },
                                validator: (value) =>
                                    value.isEmpty ? 'Enter your name' : null,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Full Name",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
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
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: TextFormField(
                                obscureText: true,
                                onChanged: (val) {
                                  password1 = val;
                                },
                                validator: (value) => value.isEmpty
                                    ? 'Enter your password'
                                    : null,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Confirm Password",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: TextFormField(
                                validator: (value) =>
                                    !EmailValidator.validate(value, true)
                                        ? 'Please enter your email'
                                        : null,
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (val) {
                                  email = val;
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              // decoration: BoxDecoration(
                              //     border: Border(
                              //         bottom:
                              //             BorderSide(color: Colors.grey[200]))
                              //             ),
                              child: TextFormField(
                                onChanged: (val) {
                                  phone = val;
                                },
                                validator: (value) => value.isEmpty
                                    ? 'Enter your phone number'
                                    : null,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Phone Number",
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
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        print(email);
                        print(password);
                        print(password1);
                        print(name);
                        print(phone);
                      }
                      AuthService()
                          .addUser(
                        name,
                        password,
                        password1,
                        email,
                        phone,
                      )
                          .then((val) {
                        if (val.data['success']) {
                          // token = val.data['token'];
                          Fluttertoast.showToast(
                              msg: val.data['msg'],
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          Fluttertoast.showToast(
                              msg: val.data['msg'],
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                        // Fluttertoast.showToast(
                        //     msg: 'Registation Successfull',
                        //     toastLength: Toast.LENGTH_SHORT,
                        //     gravity: ToastGravity.BOTTOM,
                        //     timeInSecForIosWeb: 1,
                        //     backgroundColor: Colors.green,
                        //     textColor: Colors.white,
                        //     fontSize: 16.0);
                      });
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 40,
                        // letterSpacing: 1.8,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                // RichText(
                //   text: TextSpan(children: [
                //     TextSpan(
                //       text: "Don't have an account?",
                //       style: TextStyle(
                //         color: Colors.black38,
                //         fontSize: MediaQuery.of(context).size.height / 60,
                //       ),
                //     ),
                //     TextSpan(
                //       text: " Sign Up!",
                //       style: TextStyle(
                //         color: Colors.lightBlue,
                //         fontSize: MediaQuery.of(context).size.height / 60,
                //       ),
                //     ),
                //   ]),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
