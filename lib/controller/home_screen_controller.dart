import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uisampleaug16/model/home_model.dart';

class HomeScreenController with ChangeNotifier {
  List<Homemodel>? homemodellist = [];

  Future<void> getProduct() async {
    final url = Uri.parse("https://fakestoreapi.com/products");
    

    try {
      var response = await http.get(url);
      print(response);

      if (response.statusCode == 200) {
        print(response.statusCode);
        var responses = homemodelFromJson(response.body);
        homemodellist = responses;
        print(homemodellist);
      }
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }
}
