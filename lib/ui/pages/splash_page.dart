import 'package:flutter/material.dart';
import 'package:apsensi_mobile/shared/theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primary,
        body: Center(
            child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Image.asset("assets/login.png")]))));
  }
}
