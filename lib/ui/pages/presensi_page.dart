import 'package:flutter/material.dart';
import 'package:apsensi_mobile/shared/theme.dart';

class PresensiPage extends StatelessWidget {
  const PresensiPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: transparentBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text(
          'Ini Halaman Presensi',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
