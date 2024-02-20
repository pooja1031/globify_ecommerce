import 'package:flutter/material.dart';
import 'package:myshopping/models/product.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier{
  final List<Products>_favorites=[];
  List<Products> get favorites =>_favorites;
  void toggleFavorite(Products products){
if(_favorites.contains(products)){
  _favorites.remove(products);

}else{
  _favorites.add(products);
}
notifyListeners();
  }
  bool isExist(Products products){
    final isExist =_favorites.contains(products);
    return isExist;
  }
static FavoriteProvider of(BuildContext context,{
  bool listen =true,
}){
  return Provider.of<FavoriteProvider>(context,
  listen: listen);
}
 
  }
