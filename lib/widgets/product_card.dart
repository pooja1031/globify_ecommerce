import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myshopping/Providers/cart_providers.dart';
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
    final cartProvider = CartProvider.of(context);

    return Stack(
      children: [
        Container(
          height: 350,
          width:MediaQuery.of(context).size.width/1,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
           boxShadow: [BoxShadow(color: Color.fromARGB(254, 232, 229, 229),blurRadius: 6,spreadRadius: 6)],
            color:Color.fromARGB(255, 239, 235, 235)
            
          ),
          child:
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(widget.products.name,style:TextStyle(fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.black,
            )),
            Text("\$""${widget.products.price}",
        style:TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ))
          ],
        ),
        ),
        
          
          
          
          Column(children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
                
            //     GestureDetector(
            //       onTap:()=>provider.toggleFavorite(widget.products),
            //       child: Icon(
            //                       provider.isExist(widget.products)
        
            //        ?Icons.favorite: Icons.favorite_border_outlined,color:Colors.red)),
            //   ],
            // ),
        Stack(
          children: [
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                border: Border.all(
                  color: const Color.fromARGB(255, 226, 223, 223), 
                  width: 2.0, 
                ),
              ),
            
              child: Padding(
                padding: const EdgeInsets.only(top:38.0),
                child: Image.asset(
                  widget.products.image,
                  fit: BoxFit.cover,
                ),
              ),
              
            ),
            
            Padding(
              padding: const EdgeInsets.only(top:170.0,left:200),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap:(){
                       cartProvider.toggleProducts(widget.products);
},
                    child: Container(width:45,
                    height:30,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                    color:Colors.black
                    ),
                    
                    ),
                  ),
                  Icon(Icons.add,color:Colors.white)
                ],
              ),
            ),

             Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            
                            GestureDetector(
                              onTap:()=>provider.toggleFavorite(widget.products),
                              child: CircleAvatar(
                                backgroundColor: Color.fromARGB(255, 247, 240, 240),
                                child: Icon(
                                                provider.isExist(widget.products)
                                                    
                                 ?Icons.favorite: Icons.favorite_border_outlined,color:Colors.red),
                              )),
                          ],
                        ),
          ],
        ),

          ],)
       ] );
      
    
  }
}