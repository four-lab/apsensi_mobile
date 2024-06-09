import 'dart:convert';
import 'package:apsensi_mobile/core/utils/constant.dart';
import 'package:http/http.dart' as http;

class EditProfileService {
  static Future<bool> editProfile({
    required String userId,
    required String email,
    required String fullName,
    required String placeOfBirth,
    required DateTime dateOfBirth,
    required String address,
    required String token, // User's authentication token
  }) async {
    try {
      final Uri uri = Uri.parse('${Constant.baseUrl}/user');
      String? token = await Constant.getToken();
      print('Fetch user token: $token');

      final Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

      final Map<String, dynamic> body = {
        'userId': userId,
        'email': email,
        'fullName': fullName,
        'placeOfBirth': placeOfBirth,
        'dateOfBirth': dateOfBirth.toIso8601String(),
        'address': address,
      };

      print('Request headers: $headers');
      print('Request body: ${jsonEncode(body)}');

      final response = await http.put(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      // Check response status and print response body for debugging
      final responseBody = response.body;
      print('Response status: ${response.statusCode}');
      print('Response body: $responseBody');

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedResponse = jsonDecode(responseBody);
        if (decodedResponse['meta']['status'] == 'success') {
          return true;
        } else {
          print('Failed to edit profile: ${decodedResponse['meta']['message']}');
          return false;
        }
      } else {
        print('Failed to edit profile: ${response.statusCode}');
        print('Response body: $responseBody'); // Print response body for more details
        return false;
      }
    } catch (e) {
      print('Error editing profile: $e');
      return false;
    }
  }
}
