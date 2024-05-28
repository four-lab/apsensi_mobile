// import 'dart:js';
import 'package:apsensi_mobile/ui/pages/pengajuan_izin.dart';
import 'package:flutter/material.dart';
import 'package:apsensi_mobile/shared/theme.dart';
import 'home_page.dart';
import 'jadwal_page.dart';
import 'calendar_page.dart';
import 'presensi_page.dart';
import 'pengajuan_izin.dart';

class PerizinanPage extends StatefulWidget {
  const PerizinanPage({Key? key}) : super(key: key);

  @override
  State<PerizinanPage> createState() => _PerizinanPageState();
}

class _PerizinanPageState extends State<PerizinanPage> {
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
          currentIndex: 3,
          onTap: (index) {
            if (index == 0) {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => HomePage(),
                  transitionsBuilder: (_, __, ___, child) => child,
                ),
              );
            } else if (index == 1) {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => JadwalPage(),
                  transitionsBuilder: (_, __, ___, child) => child,
                ),
              );
            } else if (index == 2) {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => CalendarPage(),
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
                color: buttonDisableColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/navbar/jadwal.png',
                width: 24,
                color: buttonDisableColor,
              ),
              label: 'Jadwal',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/navbar/kalender.png',
                width: 24,
                color: buttonDisableColor,
              ),
              label: 'Kalendar',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/navbar/perizinan.png',
                width: 24,
                color: buttonActiveColor,
              ),
              label: 'Perizinan',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
        padding: const EdgeInsets.symmetric(
          horizontal: 34,
        ),
        children: [
          tittlePage(),
          SizedBox(height: 10),
          listIzin(context),
        ],
      ),
    );
  }
}

Widget tittlePage() {
  return Container(
    margin: const EdgeInsets.only(
      top: 40,
    ),
    child: Text(
      'Daftar Izin',
      style: blackTextStyle.copyWith(
        fontSize: 18,
        fontWeight: bold,
      ),
      textAlign: TextAlign.center,
    ),
  );
}

Widget listIzin(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PengajuanIzinPage()),
            );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.center,
            child: Text(
              'Ajukan Izin Baru',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey.withOpacity(0.5)),
                      bottom: BorderSide(color: Colors.grey.withOpacity(0.5)),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dinas Keluar Kota',
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Tanggal Izin: 24 Mei 2024',
                              style: blackTextStyle.copyWith(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Status Izin',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(height: 4), // Adding some spacing between the text
                                Text(
                                  'Diterima',
                                  style: greenTextStyle.copyWith(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8), // Adding some spacing between the rows
                      Text(
                        'Lama Izin: 2 Hari',
                        style: blackTextStyle.copyWith(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey.withOpacity(0.5)),
                      bottom: BorderSide(color: Colors.grey.withOpacity(0.5)),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dinas Keluar Kota',
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Tanggal Izin: 24 Mei 2024',
                              style: blackTextStyle.copyWith(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Status Izin',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(height: 4), // Adding some spacing between the text
                                Text(
                                  'Diterima',
                                  style: greenTextStyle.copyWith(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8), // Adding some spacing between the rows
                      Text(
                        'Lama Izin: 2 Hari',
                        style: blackTextStyle.copyWith(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}


