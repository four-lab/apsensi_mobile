import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:m7_livelyness_detection/index.dart';
import 'package:apsensi_mobile/core/services/image_upload_service.dart';
import 'package:intl/intl.dart';

class CaptureController {
  final ImageUploadService _imageUploadService = ImageUploadService();

  Future<void> captureAndUpload(BuildContext context) async {
    try {
      // Memeriksa izin lokasi
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled.');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      // Mendapatkan posisi saat ini
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // Menangkap gambar menggunakan M7LivelynessDetection
      final M7CapturedImage? detectionResponse =
          await M7LivelynessDetection.instance.detectLivelyness(
        context,
        config: M7DetectionConfig(
          steps: [
            M7LivelynessStepItem(
                step: M7LivelynessStep.blink,
                title: "Kedipkan Mata",
                isCompleted: false)
          ],
        ),
      );

      if (detectionResponse == null) {
        throw Exception('Liveness detection failed.');
      }

      // Mengirim gambar beserta lokasi ke API
      Map<String, dynamic> response =
          await _imageUploadService.uploadImageWithLocation(
        detectionResponse.imgPath,
        position.latitude,
        position.longitude,
      );

      if (response['success']) {
        showSuccessDialog(context, response['message']);
      } else {
        showErrorDialog(context, response['message']);
      }
    } catch (e) {
      showErrorDialog(context, e.toString());
    }
  }

  void showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 10), () {
          Navigator.of(context).pop(true);
        });
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 100),
              SizedBox(height: 16),
              const Text('Presensi Berhasil',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: Text('Kembali Ke Beranda'),
              ),
            ],
          ),
        );
      },
    );
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error, color: Colors.red, size: 100),
              SizedBox(height: 16),
              Text(
                'Presensi Gagal',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                message,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: Text('Tutup'),
              ),
            ],
          ),
        );
      },
    );
  }
}
