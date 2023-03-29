import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Product with ChangeNotifier {
  final String? id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  Future<void> toggleFavouriteStatus() async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url =
        'https://shop-app-7658c-default-rtdb.firebaseio.com/products/$id.json';
    try {
      await http.patch(
        Uri.parse(url),
        body: json.encode(
          {
            'isFavourite': isFavorite,
          },
        ),
      );
    }catch(error) {
      isFavorite = oldStatus;
    }
  }
}
