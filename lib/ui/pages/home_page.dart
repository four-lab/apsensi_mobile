import 'package:flutter/material.dart';
import 'package:apsensi_mobile/shared/theme.dart';
import 'jadwal_page.dart';
import 'calendar_page.dart';
import 'perizinan_page.dart';
import 'presensi_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

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
          currentIndex:
              0, // Menandakan item terpilih, dalam hal ini indeks 0 untuk "Home"
          onTap: (index) {
            if (index == 1) {
              // Jika item "Jadwal" diklik, pindah ke halaman Jadwal tanpa animasi
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => JadwalPage(),
                  transitionsBuilder: (_, __, ___, child) => child,
                ),
              );
            } else if (index == 2) {
              // Jika item "Kalendar" diklik, pindah ke halaman Kalendar tanpa animasi
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
                    buttonActiveColor, // Item "Home" dipilih, sehingga warnanya aktif
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/navbar/jadwal.png',
                width: 24,
              ),
              label: 'Jadwal',
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ketika tombol floating button diklik, pindah ke halaman PresensiPage
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => PresensiPage(),
              transitionsBuilder: (_, __, ___, child) => child,
            ),
          );
        },
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
          buildCardStatusPresensi(),
          buildCardJadwalHariIni(),
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

  Widget buildCardStatusPresensi() {
    return Container(
        width: double.infinity,
        height: 149,
        margin: const EdgeInsets.only(
          top: 26,
        ),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Text(
              'Presensi Saat Ini             Kamis, 07 Maret 2024',
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              '09.30-11.00',
              style: blackTextStyle.copyWith(
                fontSize: 19,
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              'Kimia',
              style: blackTextStyle.copyWith(
                fontSize: 13,
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity, // Menyesuaikan lebar dengan parent
              height: 30,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0099FF)),
                child: Text(
                  'Check In',
                  style: TextStyle(fontSize: 10, fontWeight: bold),
                ),
              ),
            ),
          ],
        ));
  }

  Widget buildCardJadwalHariIni() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: 26,
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Tulisan rata kiri
        mainAxisSize: MainAxisSize.min, // Container mengikuti tinggi konten
        children: [
          Text(
            'Jadwal Hari Ini',
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: extrabold,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Kimia',
                  style: blackTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'XII BD-2',
                  style: blackTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '09.30-11.00 WIB',
                  style: blackTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Bimbingan Karir',
                  style: blackTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'X AKL-2',
                  style: blackTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '12:30 - 14:00 WIB',
                  style: blackTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
