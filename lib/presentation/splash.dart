import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myshopping/presentation/screens/home.dart';
import 'package:myshopping/presentation/screens/loginscreen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    });

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 156, 209, 234),
      body: Center(
        child: Image.asset("assets/images/homeimg1.png"),

      ),
    
    );
  }
}