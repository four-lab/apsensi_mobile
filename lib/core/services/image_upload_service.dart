import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../data/url_api.dart';
import 'package:apsensi_mobile/core/utils/constant.dart';

class ImageUploadService {
  Future<Map<String, dynamic>> uploadImageWithLocation(
      String imagePath, double latitude, double longitude) async {
    final url = Uri.parse(urlApi.sendLocation());
    String? token = await Constant.getToken();

    // Membuat request multipart untuk mengirimkan gambar
    final request = http.MultipartRequest('POST', url)
      ..headers.addAll({
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      })
      ..fields['latitude'] = latitude.toString()
      ..fields['longitude'] = longitude.toString()
      ..files.add(await http.MultipartFile.fromPath('image', imagePath));

    final response = await request.send();
    final responseBody = await http.Response.fromStream(response);
    final data = jsonDecode(responseBody.body);

    if (response.statusCode == 200) {
      return {
        'success': true,
        'message': data['meta']['message'],
      };
    } else {
      return {
        'success': false,
        'message': data['meta']['message'],
      };
    }
  }
}
