import 'package:apsensi_mobile/shared/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Container(
        decoration: BoxDecoration(
          gradient: background,
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100, bottom: 10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: CircleAvatar(
                      radius: 50, // Adjust the size as needed
                      backgroundImage: AssetImage('assets/home/profil_picture.png'),
                    ),
                  ),
                  SizedBox(width: 20),
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello,",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Ahmad Irsyadul Ibad",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
