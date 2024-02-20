import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myshopping/Providers/favorite_providers.dart';
import 'package:myshopping/models/product.dart';

class ProductCard extends StatefulWidget {
  final Products products;
  const ProductCard({super.key,required this.products});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final provider =FavoriteProvider .of(context);
    return Container(
      width:MediaQuery.of(context).size.width/2,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey.withOpacity(0.1)
        
      ),
      child:Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            
            GestureDetector(
              onTap:()=>provider.toggleFavorite(widget.products),
              child: Icon(
                              provider.isExist(widget.products)

               ?Icons.favorite: Icons.favorite_border_outlined,color:Colors.red)),
          ],
        ),
SizedBox(
  height: 130,
  width:130,
  child:Image.asset(widget.products.image,fit:BoxFit.cover)
),
Text(widget.products.name,style:TextStyle(
  fontSize: 14,
  color: Colors.red,
)),

Text("\$""${widget.products.price}",
style:TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
))
      ],)
    );
  }
}