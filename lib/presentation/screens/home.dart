import 'package:flutter/material.dart';
import 'package:myshopping/presentation/detailed_screen/detailed_screen.dart';
import 'package:myshopping/presentation/screens/cart_details.dart';
import 'package:myshopping/presentation/screens/favorite.dart';
import 'package:myshopping/presentation/screens/homescreen.dart';
import 'package:myshopping/presentation/screens/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex =0;
  List screens =[
    const HomeScreen(),
    const Myfav(),
        const CartDetails(),

    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("MY STORE"),
    centerTitle: true,
    actions:[
      IconButton(
        onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> const CartDetails(),)),
         icon: const Icon(Icons.add_shopping_cart))
    ]
    ),
    

    body:screens[currentIndex],
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value){
        setState(() =>currentIndex =value
          
        );
      },
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      items: const[
        BottomNavigationBarItem(icon: Icon(Icons.home),
      
      label: "Home"),
       BottomNavigationBarItem(icon: Icon(Icons.favorite),
      
      label: "favorite"),

       BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart),
      
      label: "My Cart"),
       BottomNavigationBarItem(icon: Icon(Icons.person),
       
      
      label: "Account"),

     
      //  BottomNavigationBarItem(icon: Icon(Icons.home),
      
      // label: "Home"),
      ]),
    );
  }

  
}