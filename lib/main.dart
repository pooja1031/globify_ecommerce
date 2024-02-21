import 'package:flutter/material.dart';
import 'package:myshopping/Providers/cart_providers.dart';
import 'package:myshopping/Providers/favorite_providers.dart';
import 'package:myshopping/Providers/user_provider.dart';
import 'package:myshopping/presentation/screens/home.dart';
import 'package:myshopping/presentation/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) =>MultiProvider(providers: [
    //ChangeNotifierProvider(create: (context) => UserProvider()),
     ChangeNotifierProvider(create: (_)=>FavoriteProvider()),
          ChangeNotifierProvider(create: (_)=>CartProvider())

  ],
  child: MaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black45,
        background: Color.fromARGB(255, 248, 243, 243)),
        useMaterial3: true,
      ),
      home:SplashScreen(),

      // SplashScreen()
    )
  
  );
    
  
}
