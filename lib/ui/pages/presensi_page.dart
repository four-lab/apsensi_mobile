import 'package:apsensi_mobile/core/models/jadwal/schedule.dart';
import 'package:flutter/material.dart';
import 'package:apsensi_mobile/shared/theme.dart';
import 'package:apsensi_mobile/ui/widget/presensi/presensi_widget.dart';
import 'package:apsensi_mobile/core/services/schedule_service.dart';
import 'package:apsensi_mobile/core/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:apsensi_mobile/core/controllers/log_presensi_controller.dart';
import 'package:apsensi_mobile/ui/widget/presensi/log_presensi_widget.dart';

class PresensiPage extends StatefulWidget {
  const PresensiPage({Key? key}) : super(key: key);

  @override
  _PresensiPageState createState() => _PresensiPageState();
}

class _PresensiPageState extends State<PresensiPage> {
  final AuthController authController = Get.put(AuthController());
  final LogPresensiController logPresensiController =
      Get.put(LogPresensiController()); // Initialize here

  bool _hasSchedule = true;
  List<Schedule> _scheduleList = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    authController.loadUserFromPrefs(); // Load user data from SharedPreferences
    _fetchSchedulesForToday(DateTime.now());
  }

  void _fetchSchedulesForToday(DateTime date) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final schedules = await ScheduleService.fetchSchedulesForDate(
          DateFormat('yyyy-MM-dd').format(date));
      setState(() {
        _scheduleList = schedules;
        _hasSchedule = schedules.isNotEmpty;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
        _hasSchedule = false;
      });
      print('Error fetching schedules: $error');
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Hadir':
        return Colors.green[100]!;
      case 'Telat':
        return Colors.yellow[100]!;
      case 'Absen':
        return Colors.red[100]!;
      case 'Izin':
        return Colors.blue[100]!;
      default:
        return Colors.grey[100]!;
    }
  }

  Widget _buildLogPresensi() {
    return Obx(() {
      if (logPresensiController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }
      return Container(
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
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ...logPresensiController.logPresensiList
                .map((log) => LogPresensiCard(
                      subject: log['subject'],
                      date: log['date'],
                      time: log['time'],
                      status: log['status'],
                      statusColor: _getStatusColor(log['status']),
                    ))
                .toList(),
          ],
        ),
      );
    });
  }

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
        centerTitle: true,
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
            PresensiWidget(
              schedules: _scheduleList,
              hasSchedule: _hasSchedule,
              isLoading: _isLoading,
            ),
            const SizedBox(height: 20),
            _buildLogPresensi(),
          ],
        ),
      ),
    );
  }
}








//             ),
//             const SizedBox(height: 20),
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 16),
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Log Presensi',
//                     style: blackTextStyle.copyWith(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   LogPresensiCard(
//                     subject: 'Mathematics',
//                     date: 'Kamis, 07 Maret 2024',
//                     time: '13.00 - 15.00',
//                     status: 'Hadir',
//                     statusColor: Colors.green[100]!,
//                   ),
//                   LogPresensiCard(
//                     subject: 'Chemistry',
//                     date: 'Kamis, 07 Maret 2024',
//                     time: '13.00 - 15.00',
//                     status: 'Telat',
//                     statusColor: Colors.yellow[100]!,
//                   ),
//                   LogPresensiCard(
//                     subject: 'Biology',
//                     date: 'Kamis, 07 Maret 2024',
//                     time: '13.00 - 15.00',
//                     status: 'Absen',
//                     statusColor: Colors.red[100]!,
//                   ),
//                   LogPresensiCard(
//                     subject: 'Geography',
//                     date: 'Kamis, 07 Maret 2024',
//                     time: '13.00 - 15.00',
//                     status: 'Izin',
//                     statusColor: Colors.blue[100]!,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class LogPresensiCard extends StatelessWidget {
//   final String subject;
//   final String date;
//   final String time;
//   final String status;
//   final Color statusColor;

//   LogPresensiCard({
//     required this.subject,
//     required this.date,
//     required this.time,
//     required this.status,
//     required this.statusColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 5.0),
//       padding: EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: statusColor,
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 subject,
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               Text(date),
//             ],
//           ),
//           SizedBox(height: 5),
//           Row(
//             children: [
//               Icon(Icons.access_time, size: 16),
//               SizedBox(width: 5),
//               Text(time),
//             ],
//           ),
//           SizedBox(height: 5),
//           Text('Status : $status'),
//         ],
//       ),
//     );
//   }
// }
