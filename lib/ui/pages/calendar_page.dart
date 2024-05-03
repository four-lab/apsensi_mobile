import 'package:apsensi_mobile/ui/pages/presensi_page.dart';
import 'package:flutter/material.dart';
import 'package:apsensi_mobile/shared/theme.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'perizinan_page.dart';
import 'jadwal_page.dart';
import 'home_page.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key});
  final Padding = 24.0;

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
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
              2, // Menandakan item terpilih, dalam hal ini indeks 2 untuk "Kalendar"
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
            } else if (index == 1) {
              // Jika item "Jadwal" diklik, pindah ke halaman Jadwal tanpa animasi
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => JadwalPage(),
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
                    buttonDisableColor, // Karena bukan halaman utama, warna dinonaktifkan
              ),
              label: 'Jadwal',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/navbar/kalender.png',
                width: 24,
                color:
                    buttonActiveColor, // Item "Kalendar" dipilih, sehingga warnanya aktif
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
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 34,
        ),
        children: [
          tittlePage(),
          tableCalendar(),
          eventInMonth(),
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
      'Kalender',
      style: blackTextStyle.copyWith(
        fontSize: 18,
        fontWeight: bold,
      ),
      textAlign: TextAlign.center,
    ),
  );
}

Widget tableCalendar() {
  return Container(
    margin: const EdgeInsets.only(
      top: 15,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 5,
          offset: Offset(3, 3),
        ),
      ],
    ),
    child: TableCalendar(
      calendarBuilders: CalendarBuilders(
        // Builder untuk menentukan tampilan tanggal default
        defaultBuilder: (context, date, _) {
          if (date.weekday == DateTime.sunday ||
              date.weekday == DateTime.saturday) {
            return Container(
              margin: EdgeInsets.all(5.0),
              child: Center(
                child: Text(
                  date.day.toString(),
                  style: TextStyle(color: Colors.red),
                ),
              ),
            );
          } else {
            return null;
          }
        },
        // Builder untuk menentukan tampilan hari ini
        todayBuilder: (context, day, focusedDay) {
          // Periksa apakah tanggal ini adalah tanggal hari ini
          if (isToday(day)) {
            return Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: buttonActiveColor,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Center(
                child: Text(
                  day.day.toString(),
                  style: whiteTextStyle,
                ),
              ),
            );
          } else {
            // Jika bukan tanggal hari ini, biarkan menggunakan tampilan default
            return null;
          }
        },
        // Builder untuk menentukan tampilan nama hari dalam seminggu (DOW: Day of Week)
        dowBuilder: (context, day) {
          if (day.weekday == DateTime.sunday ||
              day.weekday == DateTime.saturday) {
            final text = DateFormat.E().format(day);
            return Center(
              child: Text(
                text,
                style: TextStyle(color: Colors.red),
              ),
            );
          } else {
            return null;
          }
        },
      ),
      headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true),
      focusedDay: DateTime.now(),
      firstDay: DateTime(2021, 01, 01),
      lastDay: DateTime(2030, 12, 31),
    ),
  );
}

bool isToday(DateTime date) {
  final now = DateTime.now();
  return date.year == now.year &&
      date.month == now.month &&
      date.day == now.day;
}

Widget eventInMonth() {
  return Container(
    margin: const EdgeInsets.only(
      top: 15,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: whiteColor,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 5,
          offset: Offset(3, 3),
        ),
      ],
    ),
    child: DataTable(
      columns: [
        DataColumn(label: Text('Tanggal')),
        DataColumn(label: Text('Hari Libur')),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('1')),
          DataCell(Text('New Year')),
        ]),
        DataRow(cells: [
          DataCell(Text('14')),
          DataCell(Text('Valentine\'s Day')),
        ]),
        // Tambahkan baris DataRow sesuai dengan kebutuhan
      ],
    ),
  );
}
