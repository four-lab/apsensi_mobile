import 'package:flutter/material.dart';
import 'package:apsensi_mobile/shared/theme.dart';
import 'home_page.dart';
import 'calendar_page.dart';
import 'perizinan_page.dart';

class JadwalPage extends StatelessWidget {
  const JadwalPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: transparentBackground,
      body: Center(
        child: Text(
          'Ini Halaman Jadwal',
          style: TextStyle(fontSize: 20),
        ),
      ),
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
          currentIndex:
              1, // Menandakan item terpilih, dalam hal ini indeks 1 untuk "Jadwal"
          onTap: (index) {
            if (index == 0) {
              // Jika item "Home" diklik, kembali ke halaman Home tanpa animasi
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => HomePage(),
                  transitionsBuilder: (_, __, ___, child) => child,
                ),
              );
            } else if (index == 2) {
              // Jika item "Jadwal" diklik, pindah ke halaman Jadwal tanpa animasi
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => CalendarPage(),
                  transitionsBuilder: (_, __, ___, child) => child,
                ),
              );
            } else if (index == 3) {
              // Jika item "Perizinan" diklik, pindah ke halaman Perizinan tanpa animasi
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => PerizinanPage(),
                  transitionsBuilder: (_, __, ___, child) => child,
                ),
              );
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/navbar/home.png',
                width: 24,
                color:
                    buttonDisableColor, // Karena bukan halaman utama, warna dinonaktifkan
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/navbar/jadwal.png',
                width: 24,
                color:
                    buttonActiveColor, // Item "Jadwal" dipilih, sehingga warnanya aktif
              ),
              label: 'Jadwal',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/navbar/kalender.png',
                width: 24,
                color:
                    buttonDisableColor, // Karena bukan halaman utama, warna dinonaktifkan
              ),
              label: 'Kalendar',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/navbar/perizinan.png',
                width: 24,
                color:
                    buttonDisableColor, // Karena bukan halaman utama, warna dinonaktifkan
              ),
              label: 'Perizinan',
            ),
          ],
        ),
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
    );
  }
}
