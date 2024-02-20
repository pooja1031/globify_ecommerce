import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myshopping/Providers/cart_providers.dart';
import 'package:myshopping/models/product.dart';
import 'package:myshopping/presentation/screens/cart_details.dart';
import 'package:myshopping/widgets/availabel%20_size.dart';

class DetailedScreen extends StatelessWidget {
  final Products products;
  const DetailedScreen({super.key,required this. products});

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    
    return Scaffold(
      appBar: AppBar(title: Text("Details"),
      centerTitle: true,),
      body: Column(children: [
        const SizedBox(height: 36,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(shape: BoxShape.circle,color:Colors.redAccent),
            child: Image.asset(products.image,fit: BoxFit.cover,),
            
            ),
          ],
        ),
                const SizedBox(height: 36,),

        Container(
          padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color:Colors.white),
            child:Column(
              children: [Row(
                children: [
                  Text(products.name.toUpperCase(),
                  style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                  Text("\$""${products.price}",
style:TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
))
                ],
              ),


                            const SizedBox(height: 8,),
                            Row(children: [
                              AvailableSize(Size: "US.6"),
                               AvailableSize(Size: "US.7"),
                              AvailableSize(Size: "US.8"),
                             AvailableSize(Size: "US.9",),

                            ],),

                            const SizedBox(height: 8,),
Row(children: [
  CircleAvatar(
    radius: 16,
    backgroundColor: Colors.blue,
  ),
                              const SizedBox(height: 8,),

  CircleAvatar(
    radius: 16,
    backgroundColor: Colors.red,
  ),
                              const SizedBox(height: 8,),

  CircleAvatar(
    radius: 16,
    backgroundColor: Colors.yellow,
  )
],)
              ],
            )
            ),
      ],),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        width: double.infinity,
        height: MediaQuery.of(context).size.height/10,
        decoration: const BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10)
          )
        ),
        child:Row(children: [
           Text("\$""${products.price}",
style:TextStyle(
  fontSize: 34,
  fontWeight: FontWeight.bold,
  color: Colors.black
)),
ElevatedButton.icon(onPressed: (){
  provider.toggleProducts(products);
  Navigator.push(context,MaterialPageRoute(builder: (context)=>const CartDetails()));
}, icon: const Icon(Icons.send),
label:const Text("Add to Cart"))

        ],)
      ),
    );
  }
}