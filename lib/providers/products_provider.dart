import 'package:flutter/material.dart';
import '../models/models.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
    Product(
      id: 'p5',
      title: 'Chef Knife',
      description: 'A versatile knife for chopping, slicing, and dicing.',
      price: 79.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Victorinox_Fibrox_5.2063.20_chef%27s_knife.jpg/220px-Victorinox_Fibrox_5.2063.20_chef%27s_knife.jpg',
    ),
    Product(
      id: 'p6',
      title: 'Electric Kettle',
      description: 'Boil water quickly and easily.',
      price: 29.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Philips_Kettle.jpg/220px-Philips_Kettle.jpg',
    ),
    Product(
      id: 'p7',
      title: 'Coffee Grinder',
      description: 'Grind your own coffee beans for the freshest brew.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Coffee_grinder_-_Credit_to_http_homedust.com_%2828217902047%29.jpg/800px-Coffee_grinder_-_Credit_to_http_homedust.com_%2828217902047%29.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Immersion Blender',
      description: 'Blend soups, sauces, and smoothies right in the pot.',
      price: 39.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Wand_Blender.jpg/130px-Wand_Blender.jpg',
    ),
    Product(
      id: 'p9',
      title: 'Instant Pot',
      description:
          'A multi-functional electric pressure cooker for easy meal preparation.',
      price: 99.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Instant_Pot_%2849907000991%29.jpg/220px-Instant_Pot_%2849907000991%29.jpg',
    ),
    Product(
      id: 'p10',
      title: 'Cast Iron Skillet',
      description:
          'A durable and versatile skillet for cooking a variety of meals.',
      price: 69.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/8/8d/Dutch_Oven_-McClures_Magazine.jpg',
    ),
  ];

  var _showFavouritesOnly = false;

  List<Product> get favouriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  /*void showFavouritesOnly() {
    _showFavouritesOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavouritesOnly = false;
    notifyListeners();
  }*/

  List<Product> get items {
    if (_showFavouritesOnly) {
      return _items.where((prodItem) => prodItem.isFavorite).toList();
    }
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
