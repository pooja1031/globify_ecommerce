import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myshopping/Providers/favorite_providers.dart';

class Myfav extends StatefulWidget {
  const Myfav({super.key});

  @override
  State<Myfav> createState() => _MyfavState();
}

class _MyfavState extends State<Myfav> {
  @override
  Widget build(BuildContext context) {
    final provider =FavoriteProvider.of(context);
    final finalList = provider.favorites;
    return   Scaffold(
body:Column(
  children:  [
    Padding(
      padding: const EdgeInsets.only(top:20,left:20),
      child: Row(
        children:const  [
          Text("Favorites",style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),
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

        subtitle: Text(finalList[index].description,
        overflow: TextOverflow.ellipsis,),
        leading:CircleAvatar(radius:30,
        backgroundImage: AssetImage(finalList[index].image),
        backgroundColor: Colors.red.shade100,
        ),
        trailing: Text('\$${finalList[index].price}',
        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        tileColor: Colors.white,
        )
        
        );
      }))
  ],
)

  );
  }
}