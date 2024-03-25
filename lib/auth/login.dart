import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  static const nameRoute = '/auth/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN PAGE"),
      ),
      body: Center(
        child: Text(
          "LOGIN",
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
