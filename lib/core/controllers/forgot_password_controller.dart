import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/forgot_password_service.dart';

class ForgotPasswordController extends GetxController {
  static Future<void> requestOTP(
      BuildContext context, TextEditingController emailController) async {
    try {
      if (emailController.text.isEmpty) {
        throw 'Email harus diisi.';
      }

      await ForgotPasswordService.requestOTP(emailController.text);
      Get.snackbar(
        'Success',
        'Kode OTP telah dikirimkan ke email Anda',
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Navigasi ke halaman OTP dengan email sebagai argumen
      await Get.toNamed('/otp', arguments: {'email': emailController.text});
    } catch (error) {
      print(error.toString());
      Get.snackbar(
        'Error',
        error.toString(),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  static Future<void> verifyOTP(BuildContext context,
      TextEditingController otpController, String email) async {
    try {
      if (otpController.text.isEmpty) {
        throw 'OTP harus diisi.';
      }

      await ForgotPasswordService.verifyOTP(email, otpController.text);
      Get.snackbar(
        'Success',
        'OTP berhasil diverifikasi',
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Navigasi ke halaman reset password dengan email dan otp sebagai argumen
      await Get.toNamed('/reset-password',
          arguments: {'email': email, 'otp': otpController.text});
    } catch (error) {
      print(error.toString());
      Get.snackbar(
        'Error',
        error.toString(),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  static Future<void> resetPassword(
      BuildContext context,
      TextEditingController newPasswordController,
      String email,
      String otp) async {
    try {
      if (newPasswordController.text.isEmpty) {
        throw 'Password baru harus diisi.';
      }

      await ForgotPasswordService.resetPassword(
          email, otp, newPasswordController.text);
      Get.snackbar(
        'Success',
        'Password berhasil direset',
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Navigasi ke halaman login
      await Get.toNamed('/login');
    } catch (error) {
      print(error.toString());
      Get.snackbar(
        'Error',
        error.toString(),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
