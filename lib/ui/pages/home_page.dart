import 'package:apsensi_mobile/shared/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        children: [
        Container(
        width: 150,
        height: 47,
        margin: const EdgeInsets.only(
          top: 100,
          bottom: 10,
        ),
          child: Text("Hello,\n Ahmad Irsyadul Ibad")
        ),],
      ),
    );
  }
}