import 'package:flutter/cupertino.dart';
import 'package:apsensi_mobile/core/models/user.dart';
import 'package:apsensi_mobile/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:apsensi_mobile/core/services/auth_service.dart';
// import 'package:apsensi_mobile/ui/pages/home_page.dart';

class AuthController {

  static Future<void> login(
    BuildContext context, TextEditingController username, TextEditingController password) async {
    try {
      if (username.text.isEmpty || password.text.isEmpty) {
        throw 'Username dan Password harus diisi.';
      }

      User? user = await AuthService.login(username.text, password.text);
      if (user != null && user.token != null) {
        await Constant.saveToken(user.token!);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('login', true);
        Get.snackbar(
          'Success', 
          'Login berhasil',
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        print('API Response Body: ${user.toJson()}');

        // User? userInfo = await AuthService.getUserInfo(user.token!);
        // if (userInfo != null) {
        //   print('User Info:');
        //   print('Token: ${userInfo.token}');
        //   print('ID: ${userInfo.id}');
        //   print('Fullname: ${userInfo.fullname}');
        //   print('Birthdate: ${userInfo.birthdate}');
        //   print('Birthplace: ${userInfo.birthplace}');
        //   print('Username: ${userInfo.username}');
        //   print('Email: ${userInfo.email}');
        //   print('NIK: ${userInfo.nik}');
        //   print('Address: ${userInfo.address}');
        //   print('Gender: ${userInfo.gender}');
        //   if (userInfo.photos != null) {
        //     print('Photos:');
        //     print('  Front: ${userInfo.photos?.front}');
        //     print('  Left: ${userInfo.photos?.left}');
        //     print('  Right: ${userInfo.photos?.right}');
        //   }
        // }

        await Get.toNamed('/home');
      } else {
        throw 'Username atau Password salah.';
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
}