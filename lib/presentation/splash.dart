import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myshopping/presentation/screens/home.dart';
import 'package:myshopping/presentation/screens/loginscreen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    });

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Image.asset(""),
      ),
    );
  }
}