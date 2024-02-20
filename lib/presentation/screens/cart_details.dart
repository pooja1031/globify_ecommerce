import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        title: const Text("Your Cart"),
        centerTitle: true,
      ),


  body: Column(
  children:  [
    Padding(
      padding: const EdgeInsets.only(top:20,left:20),
      child: Row(
        children:const  [
          Text("Wanno Store",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
    Expanded(child: ListView.builder(
      itemCount: finalList.length,
      itemBuilder: (context,index){
        return Padding(padding:const EdgeInsets.all(8),
        child:Column(
          children: [
            
              Row(
                children: [
                  Container(
                        width: 100,
                        height: 100, 
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 173, 170, 170),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            finalList[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width:10),
                        Column(
                          children: [
                            Text(finalList[index].name,style:const TextStyle(fontSize: 16,)
                                        ),
                                                               Text('\$${finalList[index].price}',style: TextStyle(fontSize: 12,),),

                          ],
                        ),
             SizedBox(width: 15,)  ,         
     Column(children: [_buildProductsQuantity(Icons.add, index),
            Text(finalList[index].quantity.toString(),
            style:const TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
            _buildProductsQuantity(Icons.remove, index)
            ],),
            
           // tileColor: Colors.white,
            
          ],
        )
                ],
              ),
             
            
          
            
            
        
        );
      })),
      Container(
padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 50),
        alignment: Alignment.center,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 243, 233, 233),
          // 
        ),  
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$${provider.getTotalPrice()}',
            style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
            ),

ElevatedButton.icon(onPressed: (){
  
},icon: const Icon(Icons.send),
  label: const Text("Check Out",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.white),),
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0), 
      
    ),
        backgroundColor: Colors.redAccent, 

  ),)





          ],),    )
  ],
)
    );
  }
}