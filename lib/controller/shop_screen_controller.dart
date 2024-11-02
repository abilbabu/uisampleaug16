import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:uisampleaug16/model/home_model.dart';

class ShopScreenController with ChangeNotifier {
  Homemodel? product;
  bool isloading=false;

  getproductDetail(int productId) async {
    
    isloading=true;
    notifyListeners();
    final url=Uri.parse("https://fakestoreapi.com/products/$productId");

    try{
      var response = await http.get(url); 
      if(response.statusCode==200){
           product=Homemodel.fromJson(jsonDecode(response.body));
      }
    }catch(e){
      print(e);
    }
     isloading=false;
    notifyListeners();
  }
}