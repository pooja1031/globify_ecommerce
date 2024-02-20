import 'package:flutter/material.dart';
import 'package:myshopping/Providers/cart_providers.dart';
import 'package:myshopping/Providers/favorite_providers.dart';
import 'package:myshopping/presentation/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) =>MultiProvider(providers: [
     ChangeNotifierProvider(create: (_)=>FavoriteProvider()),
          ChangeNotifierProvider(create: (_)=>CartProvider())

  ],
  child: MaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black45),
        useMaterial3: true,
      ),
      home: HomePage(),
    )
  
  );
    
  
}
