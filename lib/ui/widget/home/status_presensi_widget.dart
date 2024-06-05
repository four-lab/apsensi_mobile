import 'package:flutter/material.dart';
import 'package:apsensi_mobile/shared/theme.dart';
import 'package:intl/intl.dart';

Widget buildCardStatusPresensi(BuildContext context) {
  String currentDate =
      DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(DateTime.now());

  // Fungsi untuk menampilkan dialog
  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop(true);
        });
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 100,
              ),
              SizedBox(height: 16),
              Text(
                'Presensi Berhasil',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Anda baru saja melakukan presensi pada pukul ${DateFormat('HH:mm:ss').format(DateTime.now())} WIB',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'Selamat bekerja dan terima kasih telah melakukan presensi',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('Kembali Ke Beranda'),
              ),
            ],
          ),
        );
      },
    );
  }

  return Container(
    width: double.infinity,
    height: 160,
    margin: const EdgeInsets.only(
      top: 26,
      left: 16,
      right: 16,
    ),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Presensi Saat Ini',
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: extrabold,
              ),
            ),
            Text(
              currentDate,
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: extrabold,
              ),
            ),
          ],
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
        Spacer(),
        SizedBox(
          width: double.infinity,
          height: 30,
          child: ElevatedButton(
            onPressed: () {
              showSuccessDialog(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff0099FF),
            ),
            child: Text(
              'Check In',
              style: TextStyle(
                fontSize: 10,
                fontWeight: bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
