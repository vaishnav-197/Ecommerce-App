import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  Dio dio = new Dio();

  login(email, password) async {
    try {
      return await dio.post('https://apiecomdemo.herokuapp.com/authenticate',
          data: {"email": email, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  addUser(name, password, password1, email, phone) async {
    return await dio.post('https://apiecomdemo.herokuapp.com/adduser',
        data: {
          "name": name,
          "password": password,
          "password1": password1,
          "email": email,
          "phone": phone
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  dash(token) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    return await dio.get('https://apiecomdemo.herokuapp.com/dash');
  }
}
