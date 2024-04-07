import 'package:flutter/material.dart';
import 'package:apsensi_mobile/shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        elevation: 0,
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: whiteColor,
            elevation: 0,
            selectedItemColor: buttonActiveColor,
            unselectedItemColor: buttonDisableColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: blueTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
            unselectedLabelStyle: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/navbar/kalender.png',
                  width: 24,
                  color: buttonActiveColor,
                ),
                label: 'Kalender',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/navbar/jadwal.png',
                  width: 24,
                ),
                label: 'Overview',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/navbar/presensi.png',
                  width: 24,
                ),
                label: 'Presensi',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/navbar/perizinan.png',
                  width: 24,
                ),
                label: 'Perizinan',
              ),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: buttonActiveColor,
        shape: const CircleBorder(),
        child: Image.asset(
          'assets/navbar/home.png',
          width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
