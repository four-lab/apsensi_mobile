import 'dart:convert';
import 'package:apsensi_mobile/core/models/user.dart';
import 'package:apsensi_mobile/core/utils/constant.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  
  static Future<User?> login(String username, String password) async {
    final url = Uri.parse('${Constant.baseUrl}/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      try {
        final result = jsonDecode(response.body);
        print('Login response: $result');
        return User.fromJson(result['data']);
      } catch (e) {
        print('Failed to decode login response: $e');
        throw 'Failed to decode login response';
      }
    } else {
      final errorResult = jsonDecode(response.body);
      print('Login error response: $errorResult');
      throw '${errorResult['meta']['message'] ?? 'Unknown error occurred'}';
    }
  }

  static Future<void> logout(SharedPreferences preferences) async {
    final url = Uri.parse('${Constant.baseUrl}/logout');
    final token = preferences.getString('token');
    if (token != null) {
      await http.delete(
        url,
        headers: {
          'Authorization': 'Bearer $token'
        }
      );
    } else {
      throw 'Token tidak ditemukan';
    }
  }

  static Future<User?> getUserInfo(String token) async {
    if (token == null) {
      throw 'Token tidak tersedia';
    }
    
    final url = Uri.parse('${Constant.baseUrl}/user');
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }
    );

    if (response.statusCode == 200) {
    try {
      final result = jsonDecode(response.body);
      print('User info response: $result');
      
      if (result['data'] != null) {
        return User.fromJson(result['data']);
      } else {
        throw 'Data user tidak tersedia';
      }
    } catch (e) {
      print('Failed to decode user info response: $e');
      throw 'Failed to decode user info response';
    }
  } else {
    final errorResult = jsonDecode(response.body);
    print('User info error response: $errorResult');
    throw '${errorResult['meta']['message'] ?? 'Unknown error occured'}';
  }
  }
}