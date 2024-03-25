import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  static const nameRoute = '/auth/splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SPLASH PAGE"),
      ),
      body: Center(
        child: Text(
          "SPLASH",
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
