import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../data/url_api.dart';

class ForgotPasswordService {
  static Future<void> requestOTP(String email) async {
    final response = await http.post(
      Uri.parse(urlApi.forgotPassword()),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'username': email}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to request OTP');
    }
  }

  static Future<void> verifyOTP(String email, String otp) async {
    final response = await http.post(
      Uri.parse(urlApi.codeOTP()),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'email': email, 'otp': otp}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to verify OTP');
    }
  }

  static Future<void> resetPassword(
      String email, String otp, String newPassword) async {
    final response = await http.post(
      Uri.parse(urlApi.resetPassword()),
      headers: {
        'Content-Type': 'application/json',
      },
      body:
          jsonEncode({'email': email, 'otp': otp, 'new_password': newPassword}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to reset password');
    }
  }
}
