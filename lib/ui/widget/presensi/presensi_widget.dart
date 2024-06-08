import 'package:flutter/material.dart';
import 'package:apsensi_mobile/shared/theme.dart';
import 'package:intl/intl.dart';
import 'package:m7_livelyness_detection/index.dart';
import 'package:apsensi_mobile/core/controllers/checkin_controller.dart';

class PresensiWidget extends StatefulWidget {
  @override
  _PresensiWidgetState createState() => _PresensiWidgetState();
}

class _PresensiWidgetState extends State<PresensiWidget> {
  final CheckInController _checkInController = CheckInController();
  bool _isLoading = false;

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 10), () {
          Navigator.of(context).pop(true);
        });
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 100,
              ),
              SizedBox(height: 16),
              const Text(
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
              const Text(
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

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error,
                color: Colors.red,
                size: 100,
              ),
              SizedBox(height: 16),
              Text(
                message,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('Tutup'),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _startPresence() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Validasi lokasi terlebih dahulu
      bool isLocationValid = await _checkInController.checkIn(context);

      if (isLocationValid) {
        // Jika validasi lokasi berhasil, lanjutkan dengan deteksi kehadiran
        final M7CapturedImage? detectionResponse =
            await M7LivelynessDetection.instance.detectLivelyness(context,
                config: M7DetectionConfig(steps: [
                  M7LivelynessStepItem(step: M7LivelynessStep.blink, title: "Kedipkan Mata", isCompleted: false)
                ]));

        if (detectionResponse != null) {
          showSuccessDialog();
        }
      } else {
        showErrorDialog("Lokasi tidak valid.");
      }
    } catch (e) {
      showErrorDialog("Gagal melakukan presensi: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String currentDate =
        DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(DateTime.now());

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
              onPressed: _isLoading ? null : _startPresence,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0099FF),
              ),
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text(
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
}
