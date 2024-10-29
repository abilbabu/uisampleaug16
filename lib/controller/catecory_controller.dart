import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class CatecoryController with ChangeNotifier {
  List  catecoryList=[];
  getadata() async {
    final url = Uri.parse("https://fakestoreapi.com/products/categories");

    try {
      var response=await http.get(url);

      if(response.statusCode==200){
        print(response.body);
        var convertjson=jsonDecode(response.body);
        catecoryList=convertjson;
        print(catecoryList);
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
