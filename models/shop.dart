import 'package:flutter/cupertino.dart';
import 'package:sd_assignment01/models/product.dart';

class Shop extends ChangeNotifier{
  //products for sale
  final List<Product> _shop = [
    //product - 1
    Product(
      name: "PRISONER",
      price: 50000.00,
      description: "Everyone's feeling about his own internal prison-ship in a certain boundary ~ An Art By Tasrik",
      imagePath: 'assets/Prisoner.jpg',
    ),

    //product - 2
    Product(
      name: "HOUSE NO 10",
      price: 8000.00,
      description: "HOUSE NO 10 ~ An Art By Tasrik",
      imagePath: 'assets/House_no_10.jpg',
    ),

    //product - 3
    Product(
      name: "THOUGHTS",
      price: 15000.00,
      description: "Art of thinking ~ An Art By Tasrik",
      imagePath: 'assets/Thoughts.jpg',
    ),

    //product - 4
    Product(
      name: "THE NEST",
      price: 10000.00,
      description: "Birds nest ~ An Art By Tasrik",
      imagePath: 'assets/The_Nest.jpg',
    ),
  ];

  // users cart
  List<Product> _cart = [];

  //get product list
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;

  // add item to the cart
  void addToCart(Product item){
    _cart.add(item);
    notifyListeners();
  }

  //remove item from the cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
