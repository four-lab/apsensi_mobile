import 'package:apsensi_mobile/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apsensi_mobile/ui/pages/forgot_password_page.dart';
import 'package:apsensi_mobile/ui/pages/otp_page.dart';
import 'package:apsensi_mobile/ui/pages/reset_password_page.dart';
import 'package:apsensi_mobile/ui/pages/login_page.dart';

class RouteApp {
  static final pages = [
    GetPage(name: '/login', page: () => const LoginPage()),
    GetPage(name: '/forgot-password', page: () => const ForgotPage()),
    GetPage(
      name: '/otp',
      page: () {
        final args = Get.arguments as Map<String, dynamic>;
        final email = args['email'] as String;
        return OtpPage(email: email);
      },
    ),
    GetPage(name: '/reset-password', page: () => const ResetPasswordPage()),

    GetPage(name: '/home', page: () => const HomePage()),
  ];
}