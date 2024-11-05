import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uisampleaug16/model/home_model.dart';

class CartScreenController with ChangeNotifier {
  static late Database database;
  List<Map<String, dynamic>> storedProducts = [];

  static Future initDb() async {
    database = await openDatabase("cartdb1.Db", version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Cart (id INTEGER PRIMARY KEY, title TEXT,qty INTEGER ,designation TEXT,image TEXT,productId INTEGER)');
    });
  }

  Future getAllProduct() async {
    storedProducts = await database.rawQuery('SELECT * FROM Cart');
    log(storedProducts.toString());
    notifyListeners();
  }

  Future addProduct(Homemodel getProduct) async {
    bool alreadyCart = storedProducts.any(
      (element) => getProduct.id == element["productId"],
    );

    if (alreadyCart) {
      log("already in cart");
    } else {
      await database.rawInsert(
          'INSERT INTO Cart(title, qty, designation,image,productId) VALUES(?, ?, ?, ?, ?)',
          [
            getProduct.title,
            1,
            getProduct.description,
            getProduct.image,
            getProduct.id
          ]);
    }
    notifyListeners();
  }

  incrementQty() {}
  decrementQty() {}

  removeProduct(int id) async {
    await database.rawDelete('DELETE FROM Cart WHERE id  = ?', [id]);
    getAllProduct();
  }
}
