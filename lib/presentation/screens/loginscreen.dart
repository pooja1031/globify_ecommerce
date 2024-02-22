


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myshopping/presentation/screens/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    String baseUrl = "https://fluttertest.devasthanam.org.in/public/api/";
    String loginEndpoint = "testlogin";

    try {
      var response = await http.post(
        Uri.parse('$baseUrl$loginEndpoint'),
        body: {
          'name': nameController.text,
          'password': passwordController.text,
        },
      );

      if (response.statusCode == 200) {
        var token = response.body;

        print("Login successful! Token: $token");

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        print("Login failed. Status code: ${response.statusCode}, Response: ${response.body}");
      }
    } catch (error) {
      print("Error during login: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => login(context),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


