import 'package:apsensi_mobile/core/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:apsensi_mobile/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:apsensi_mobile/core/services/auth_service.dart';

class AuthController {

  static Future<void> login(
    BuildContext context, TextEditingController username, TextEditingController password) async {
    try {
      if (username.text.isEmpty || password.text.isEmpty) {
        throw 'Username dan Password harus diisi.';
      }

      await AuthService.login(username.text, password.text);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('login', true);
        Get.snackbar(
          'Success', 
          'Login berhasil',
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        await fetchUserData();

        await Get.toNamed('/home');
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

  static Future<void> logout(
    BuildContext context, SharedPreferences preferences) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('login');
      await AuthService.logout(preferences);
      Get.offAllNamed('/login');
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

  static Future<void> fetchUserData() async {
    try {
      String? token = await Constant.getToken();
      User? user = await AuthService.getUser(token!);
      if (user != null) {
        // print('User data: ${user.toJson()}');
      } else {
        print('No user data fetched');
      }
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