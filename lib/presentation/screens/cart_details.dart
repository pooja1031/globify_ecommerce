import 'package:flutter/material.dart';
import 'package:myshopping/Providers/cart_providers.dart';

class CartDetails extends StatefulWidget {
  const CartDetails({super.key});

  @override
  State<CartDetails> createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  @override
   Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    _buildProductsQuantity(IconData icon ,int index){
      return GestureDetector(
        onTap:(){
        setState((){
          icon==Icons.add ?provider.incrementQuantity(index):provider.decrementQuantity(index);
        });
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,color:Colors.red.shade100,
          ),
          child:Icon(icon,size:20)
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        centerTitle: true,
      ),
    );
  }
}