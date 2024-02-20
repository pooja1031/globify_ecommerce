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
    final finalList = provider.cart;
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
    return 
    Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        centerTitle: true,
      ),


  body: Column(
  children:  [
    Padding(
      padding: const EdgeInsets.only(top:20,left:20),
      child: Row(
        children:const  [
          Text("Myy cart",style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
    Expanded(child: ListView.builder(
      itemCount: finalList.length,
      itemBuilder: (context,index){
        return Padding(padding:const EdgeInsets.all(8),
        child:ListTile(title: Text(finalList[index].name,style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
        ),

        subtitle: Text('\$${finalList[index].price}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        leading:CircleAvatar(radius:30,
        backgroundImage: AssetImage(finalList[index].image),
        backgroundColor: Colors.red.shade100,
        ),
        trailing: Column(children: [_buildProductsQuantity(Icons.add, index),
        Text(finalList[index].quantity.toString(),
        style:const TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
        _buildProductsQuantity(Icons.remove, index)
        ],),

        tileColor: Colors.white,
        )
        
        );
      })),
      Container(
padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10)
          )
        ),  
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$${provider.getTotalPrice()}',
            style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
            ),

ElevatedButton.icon(onPressed: (){
  
}, icon: const Icon(Icons.send),
label:const Text("check out"))






          ],),    )
  ],
)
    );
  }
}