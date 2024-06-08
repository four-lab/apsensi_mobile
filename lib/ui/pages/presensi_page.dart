import 'package:flutter/material.dart';
import 'package:apsensi_mobile/shared/theme.dart';
import 'package:apsensi_mobile/ui/widget/presensi/presensi_widget.dart';

class PresensiPage extends StatelessWidget {
  const PresensiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: transparentBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Presensi',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Tambahkan ini untuk membuat title berada di tengah
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PresensiWidget(),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Log Presensi',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  LogPresensiCard(
                    subject: 'Mathematics',
                    date: 'Kamis, 07 Maret 2024',
                    time: '13.00 - 15.00',
                    status: 'Hadir',
                    statusColor: Colors.green[100]!,
                  ),
                  LogPresensiCard(
                    subject: 'Chemistry',
                    date: 'Kamis, 07 Maret 2024',
                    time: '13.00 - 15.00',
                    status: 'Telat',
                    statusColor: Colors.yellow[100]!,
                  ),
                  LogPresensiCard(
                    subject: 'Biology',
                    date: 'Kamis, 07 Maret 2024',
                    time: '13.00 - 15.00',
                    status: 'Absen',
                    statusColor: Colors.red[100]!,
                  ),
                  LogPresensiCard(
                    subject: 'Geography',
                    date: 'Kamis, 07 Maret 2024',
                    time: '13.00 - 15.00',
                    status: 'Izin',
                    statusColor: Colors.blue[100]!,
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

class LogPresensiCard extends StatelessWidget {
  final String subject;
  final String date;
  final String time;
  final String status;
  final Color statusColor;

  LogPresensiCard({
    required this.subject,
    required this.date,
    required this.time,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: statusColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subject,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(date),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.access_time, size: 16),
              SizedBox(width: 5),
              Text(time),
            ],
          ),
          SizedBox(height: 5),
          Text('Status : $status'),
        ],
      ),
    );
  }
}
