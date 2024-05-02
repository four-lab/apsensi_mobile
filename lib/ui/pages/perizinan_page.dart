import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:apsensi_mobile/shared/theme.dart';
import 'package:intl/intl.dart';
import 'home_page.dart';
import 'jadwal_page.dart';
import 'calendar_page.dart';

class PerizinanPage extends StatefulWidget {
  const PerizinanPage({Key? key});

  @override
  State<PerizinanPage> createState() => _PerizinanPageState();
}

class _PerizinanPageState extends State<PerizinanPage> {
  String? _selectedItem; // Letakkan variabel di sini
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController= TextEditingController();

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
          horizontal: 12,
        ),
        children: [
          perizinanTittle(),
          perizinanForm(),
        ],
      ),
    );
  }

  Widget perizinanTittle() {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      child: Text(
        'Pengajuan Izin',
        style: blackTextStyle.copyWith(
          fontSize: 18,
          fontWeight: medium,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget perizinanForm() {
    return Container(
      margin: const EdgeInsets.only(
        top: 15,
      ),
      padding: const EdgeInsetsDirectional.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jenis Izin',
          ),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: whiteColor,
              border: Border.all(color: buttonDisableColor),
              borderRadius: BorderRadius.circular(20),
            ),
            child: DropdownButton<String>(
              hint: Text('Pilih Jenis Izin'),
              padding: EdgeInsets.only(left: 10),
              isExpanded: true,
              value: _selectedItem,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItem = newValue!;
                });
              },
              items: <String>[
                'Dinas Keluar Kota',
                'Sakit',
                'Kepentingan Keluarga',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 8),
          Text(
          'Deskripsi'
          ),
          SizedBox(height: 8),
          TextField(
            controller: descriptionController,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "Masukkan Deskripsi",
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              contentPadding: EdgeInsets.all(10),
            ),
          ),
          SizedBox(height: 8),
          Text(
          'Tanggal Izin'
          ),
          SizedBox(height: 8),
          
          // tempat tanggal

          SizedBox(height: 8),
          Text(
            'Lampiran'
          ),
          SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 300,
            child: TextButton(
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles();

                if (result != null) {
                  PlatformFile file = result.files.first;

                  print('Path: ${file.path}');
                  print('Byte Count: ${file.bytes}');
                  print('Name: ${file.name}');
                  print('Extension: ${file.extension}');
                  print('Size: ${file.size}');
                } else {
                  // User canceled the picker
                }
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.white, // Warna latar belakang menggunakan putih
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Bentuk tombol
                  side: BorderSide(color: Colors.black, width: 0.4), // Border dengan warna hitam dan lebar 0.4
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                  'assets/perizinan/pdfIcon.png', // Path gambar PDF
                  width: 48, // Lebar gambar
                ),
                  SizedBox(width: 8), // Jarak antara ikon dan teks
                  Text(
                    'Hanya file dengan format PDF', // Teks
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ), // Ukuran teks
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            width: double.infinity, // Lebar tombol
            height: 40, // Tinggi tombol
            child: ElevatedButton(
              onPressed: () {
                // Fungsi yang akan dijalankan saat tombol ditekan
              },
              child: Text('Ajukan'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: buttonActiveColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
