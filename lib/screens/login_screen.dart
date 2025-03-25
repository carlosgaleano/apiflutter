/**
 * @Author: Carlos Galeano
 * @Date:   2025-03-25 16:31:45
 * @Last Modified by:   Carlos Galeano
 * @Last Modified time: 2025-03-25 16:32:04
 */
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? token;
  int counter = 0;
  Timer? timer;

  Future<void> handleLogin() async {
    final url = Uri.parse('https://apitsa.logytechchile.cl/api/login');
    try {
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': emailController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          token = data['access_token'];
        });
        startCounter();
      } else {
        showError('Login failed. Check your credentials.');
      }
    } catch (error) {
      showError('Login failed: $error');
    }
  }

  void startCounter() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        counter++;
      });
    });
  }

  void showError(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: token == null
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: handleLogin,
                      child: Text('Login'),
                    ),
                  ],
                )
              : Text(
                  'Counter: $counter',
                  style: TextStyle(fontSize: 24),
                ),
        ),
      ),
    );
  }
}
