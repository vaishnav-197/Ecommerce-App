import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';


class DashItems{

  Dio dio = new Dio();


  dashproduct(token) async{
    dio.options.headers['Authorization'] = 'Bearer $token';
    return await dio.get('https://apiecomdemo.herokuapp.com/dash');

  }

  List<Product> getprod(response){
   List<Product> prod=[];
   int num =response.data['prod'].length;
   int i=0;
   while(i<num){

     Product pro =new Product(product_id:response.data['prod'][i]['_id'],price: response.data['prod'][i]['price'] ,code:response.data['prod'][i]['cat'],desc: response.data['prod'][i]['desc'],imgurl: response.data['prod'][i]['img'],name: response.data['prod'][i]['name'] );
     prod.add(pro);
     i=i+1;
   }
   return prod;
  }

  List<Product> getCatProducts(category,products){
    List<Product> selected=[];
    int count=products.length;
    int i=0;
    while(i<count){
      if(products[i].code.toString()==category){

        selected.add(products[i]);
      }
      i=i+1;
    }
    return selected;
  }

}

class Product{
  final String product_id, name , price , desc , imgurl , code ;
  Product({this.product_id,this.name,this.price,this.desc,this.imgurl,this.code});

}