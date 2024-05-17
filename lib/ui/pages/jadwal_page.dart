// ignore_for_file: prefer_const_constructors

import 'package:apsensi_mobile/models/schedule.dart';
import 'package:apsensi_mobile/ui/pages/presensi_page.dart';
import 'package:apsensi_mobile/ui/widget/schedule/schedule_timeline.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:date_picker_timeline/extra/dimen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:apsensi_mobile/shared/theme.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'home_page.dart';
import 'calendar_page.dart';
import 'perizinan_page.dart';

class JadwalPage extends StatelessWidget {
  const JadwalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Schedule> scheduleList = Schedule.generateSchedule();
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
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 34),
          children: [
            titlePage(),
            date(),
            datePicker(),
            scheduleTitle(),
            ScheduleTimeline(scheduleList: scheduleList),
          ],
        ));
  }
}

Widget titlePage() {
  return Container(
    margin: const EdgeInsets.only(
      top: 40,
    ),
    child: Text(
      'Jadwal',
      style: blackTextStyle.copyWith(
        fontSize: 18,
        fontWeight: bold,
      ),
      textAlign: TextAlign.center,
    ),
  );
}

Widget date() {
  final now = DateTime.now();
  final formattedDate = DateFormat('d MMM yyyy').format(now);

  return Container(
    margin: const EdgeInsets.only(
      top: 15,
    ),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.4000000059604645),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
    ),
    child: Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            //Container box bertuliskan tanggal sekarang
            width: 156,
            height: 66,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  width: 146,
                  height: 50,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Text(
                          '${formattedDate.split(' ')[0].padLeft(2, '0')}',
                          style: GoogleFonts.poppins(
                            color: Color(0xFF202525),
                            fontSize: 44,
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 61,
                        top: 11,
                        child: Text(
                          DateFormat('E').format(now),
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 61,
                        top: 33,
                        child: Text(
                          DateFormat('MMM yyyy').format(now),
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            //Container Box bertuliskan "Today"
            width: 83,
            height: 40,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  width: 83,
                  height: 40,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Opacity(
                          opacity: 0.10,
                          child: Container(
                            width: 83,
                            height: 40,
                            decoration: ShapeDecoration(
                              color: const Color(0xFF338C65),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Center(
                          child: Text(
                            'Today',
                            style: GoogleFonts.poppins(
                              color: Color(0xFF2E9769),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
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

Widget datePicker() {
  return Container(
    margin: const EdgeInsets.only(
      top: 0,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0)),
    ),
    child: Container(
      height: 85,
      width: 60,
      child: DatePicker(
        DateTime.now(),
        initialSelectedDate: DateTime.now(),
        selectionColor: Color(0xFF0099FF),
        selectedTextColor: Colors.white,
        daysCount: 30,
        deactivatedColor: Colors.grey,
        dateTextStyle: GoogleFonts.poppins(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
        dayTextStyle: GoogleFonts.poppins(
            fontSize: Dimen.dayTextSize, color: Colors.grey),
        monthTextStyle: GoogleFonts.poppins(
            fontSize: Dimen.monthTextSize, color: Colors.grey),
      ),
    ),
  );
}

Widget scheduleTitle() {
  return Container(
      margin: const EdgeInsets.only(
        top: 13,
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Time',
              style: GoogleFonts.poppins(
                color: Color(0xFFBCC1CD),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 34),
            Text(
              'Course',
              style: GoogleFonts.poppins(
                color: Color(0xFFBCC1CD),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: Icon(
                Icons.sort_outlined,
                color: Color(0xFFBCC1CD),
              ),
            )
          ],
        ),
      ));
}
