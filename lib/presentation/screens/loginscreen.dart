// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:myshopping/Providers/user_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;


// class LoginScreen extends StatelessWidget {
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: usernameController,
//               decoration: InputDecoration(labelText: 'Username'),
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   await loginUser(
//                     usernameController.text,
//                     passwordController.text,
//                     context,
//                   );
//                   Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(
//                       builder: (context) => HomeScreen(),
//                     ),
//                   );
//                 } catch (e) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text('Login failed'),
//                     ),
//                   );
//                 }
//               },
//               child: Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Future<void> loginUser(String username, String password, BuildContext context) async {
//   try {
//     final response = await http.post(
//       Uri.parse('https://fluttertest.devasthanam.org.in/public/api/testlogin'),
//       body: {'username': username, 'password': password},
//     );

//     print('Response Code: ${response.statusCode}');
//     print('Response Body: ${response.body}');

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       final apiKey = data['apiKey'];
//       final token = data['token'];

//       Provider.of<UserProvider>(context, listen: false).setCredentials(apiKey, token);
//     } else {
//       throw Exception('Failed to login. Status Code: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Exception: $e');
//     throw Exception('Failed to login. Exception: $e');
//   }
// }


// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final userProvider = Provider.of<UserProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: Center(
//         child: Text('API Key: ${userProvider.apiKey}\nToken: ${userProvider.token}'),
//       ),
//     );
//   }
// }