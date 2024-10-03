import 'package:flutter/material.dart';
import 'shoe.dart';

class Cart extends ChangeNotifier {
  //List of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Air Jordans',
      price: '236',
      description: 'Agali ga gnagnoko',
      imagePath: 'lib/images/shoes1.png',
    ),
    Shoe(
      name: 'Zoom FREAK',
      price: '236',
      description: 'Inthe depths of lionelless',
      imagePath: 'lib/images/shoes2.png',
    ),
    Shoe(
      name: 'All Star',
      price: '236',
      description: 'lorem ipsuum dolor sit emet',
      imagePath: 'lib/images/shoes3.png',
    ),
    Shoe(
      name: 'Nike',
      price: '236',
      description: 'Lorem Ipsum Dolor Sit Emet',
      imagePath: 'lib/images/shoes3.png',
    ),
  ];

  //List of items in user cart
  List<Shoe> userCart = [];

  //get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  //get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  //add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //remove items from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
