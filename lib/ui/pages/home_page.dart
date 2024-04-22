import 'package:flutter/material.dart';
import 'package:apsensi_mobile/shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: transparentBackground,
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
                  'assets/navbar/home.png',
                  width: 24,
                  color: buttonActiveColor,
                ),
                label: 'Home',
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
                  'assets/navbar/kalender.png',
                  width: 24,
                ),
                label: 'Kalendar',
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
          'assets/navbar/presensi.png',
          width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 34,
        ),
        children: [
          buildProfile(),
        ],
      ),
    );
  }

  Widget buildProfile() {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello,',
                style: whiteTextStyle.copyWith(
                  fontSize: 19,
                  fontWeight: bold,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Irsyadul Ibad',
                style: whiteTextStyle.copyWith(
                  fontSize: 19,
                  fontWeight: bold,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '3456245678',
                style: whiteTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: semibold,
                ),
              ),
            ],
          ),
          Container(
            width: 35,
            height: 35,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('assets/home/profil_picture.png')),
            ),
          )
        ],
      ),
    );
  }
}
