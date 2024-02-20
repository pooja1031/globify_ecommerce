import 'package:flutter/material.dart';
import 'package:myshopping/models/product.dart';
import 'package:provider/provider.dart';



class  CartProvider extends ChangeNotifier{
  final List<Products>_cart=[];
  List<Products> get cart =>_cart;
  void toggleProducts(Products products){
if(_cart.contains(products)){
 for(Products element in _cart){
  element.quantity++;
 }
}else{
  _cart.add(products);
}
notifyListeners();
  }

  incrementQuantity(int index)=>_cart[index].quantity++;
    decrementQuantity(int index)=>_cart[index].quantity--;

  getTotalPrice(){
    double total= 0.0;{
      for (Products element in _cart){
        total += element.price*element.quantity;
      }
      return total;
    }
    
  }
static CartProvider of(BuildContext context,{
  bool listen =true,
}){
  return Provider.of<CartProvider>(context,
  listen: listen);
}
}