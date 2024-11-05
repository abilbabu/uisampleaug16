import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uisampleaug16/model/home_model.dart';

class HomeScreenController with ChangeNotifier {
  List<Homemodel> productList = [];
  List catecoryList = [];
  int selectedIndexCategory = 0;

  bool isloading = false;
  bool isProductloading = false;

  Future<void> getProduct() async {
    isProductloading = true;
    notifyListeners();
    final allProductUrl = Uri.parse("https://fakestoreapi.com/products");
    final allCategoryProductUrl = Uri.parse(
        "https://fakestoreapi.com/products/category/${catecoryList[selectedIndexCategory]}");

    try {
      var response = await http.get(
          selectedIndexCategory == 0 ? allProductUrl : allCategoryProductUrl);
      print(response);

      if (response.statusCode == 200) {
        print(response.statusCode);
        var responses = homemodelFromJson(response.body);
        productList = responses;
        print(productList);
      }
    } catch (e) {
      print(e);
    }
    isProductloading = false;
    notifyListeners();
  }

// category datafetch
  getCategory() async {
    isloading = true;
    notifyListeners();
    final url = Uri.parse("https://fakestoreapi.com/products/categories");

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        print(response.body);
        var convertjson = jsonDecode(response.body);
        catecoryList = convertjson;
        catecoryList.insert(0, "All"); // insert add one data in database
        print(catecoryList);
      }
    } catch (e) {
      print(e);
    }
    isloading = false;
    notifyListeners();
  }

// Category data select section
  onCategorySelection(int clickedIndex) async {
    if(selectedIndexCategory != clickedIndex && isProductloading == false){
       selectedIndexCategory = clickedIndex;
    print(selectedIndexCategory);
    notifyListeners();
    }
    await getProduct();
  }
}
