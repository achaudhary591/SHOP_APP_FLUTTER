import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/models.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _items = [
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
    Product(
      id: 'p11',
      title: 'Toaster Oven',
      description: 'Toast, bake, and broil with ease in a compact design.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/1/16/Toaster_oven.jpg',
    ),
    Product(
      id: 'p12',
      title: 'Air Fryer',
      description: 'Fry foods with little to no oil for a healthier option.',
      price: 79.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Airfryer.jpg/220px-Airfryer.jpg',
    ),
    Product(
      id: 'p13',
      title: 'Slow Cooker',
      description: 'Cook meals slowly and evenly for a delicious result.',
      price: 69.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Oval_Crock_Pot2.jpg/220px-Oval_Crock_Pot2.jpg',
    ),
    Product(
      id: 'p14',
      title: 'Electric Griddle',
      description:
          'Cook breakfast favorites like pancakes, eggs, and bacon with ease.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Electric_griddle.jpg/800px-Electric_griddle.jpg?20080217090908',
    ),
    Product(
      id: 'p15',
      title: 'Handheld Milk  Frother',
      description: 'Create frothy milk for coffee, tea, and other beverages.',
      price: 19.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Melkklopper.jpg/200px-Melkklopper.jpg',
    ),
    Product(
      id: 'p16',
      title: 'Waffle Maker',
      description:
          'Make crispy waffles with non-stick plates and adjustable settings.',
      price: 39.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Belgian_waffles_cooked_in_a_Krampouz_cast-iron_waffle_iron.JPG/250px-Belgian_waffles_cooked_in_a_Krampouz_cast-iron_waffle_iron.JPG',
    ),
    Product(
      id: 'p17',
      title: 'Citrus Juicer',
      description: 'Extract juice from citrus fruits with minimal effort.',
      price: 24.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Depression_Glass_Juicer.jpg/230px-Depression_Glass_Juicer.jpg',
    ),
    Product(
      id: 'p18',
      title: 'Electric Grill',
      description:
          'Grill indoors with adjustable temperature and non-stick surface.',
      price: 89.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Carne_asada_chorizo.jpg/220px-Carne_asada_chorizo.jpg',
    ),
    Product(
      id: 'p19',
      title: 'Food Dehydrator',
      description: 'Make homemade dried fruit, jerky, and more.',
      price: 79.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Food_dehydrator.jpg/220px-Food_dehydrator.jpg',
    ),
    Product(
      id: 'p20',
      title: 'Electric Can Opener',
      description: 'Open cans with ease and precision.',
      price: 19.99,
      imageUrl:
          'https://wiki.ece.cmu.edu/ddl/images/thumb/Team5AutoCanOpenerTop.JPG/300px-Team5AutoCanOpenerTop.JPG',
    ),
  ];

  final _showFavouritesOnly = false;

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

  Future<void> addProduct(Product product) {
    const url =
        'https://shop-app-7658c-default-rtdb.firebaseio.com/products';
    return http
        .post(
      Uri.parse(url),
      body: json.encode({
        'title': product.title,
        'description': product.description,
        'imageUrl': product.imageUrl,
        'price': product.price,
        'isFavorite': product.isFavorite,
      }),
    )
        .then((response) {
      final newProduct = Product(
        id: json.decode(response.body)['name'],
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
      );
      _items.add(newProduct);
      // _items.insert(0, newProduct);
      notifyListeners();
      print(json.decode(response.body)['name']);
    }).catchError((error){
      print(error.message);
      throw error;
    });
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('.....');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
