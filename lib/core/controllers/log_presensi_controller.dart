import 'package:get/get.dart';
import 'package:apsensi_mobile/core/services/log_presensi_service.dart';

class LogPresensiController extends GetxController {
  var isLoading = false.obs;
  var logPresensiList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    fetchLogPresensi();
    super.onInit();
  }

  void fetchLogPresensi() async {
    isLoading(true);
    try {
      var logs = await LogPresensiService.fetchLogPresensi();
      logPresensiList.assignAll(logs);
    } finally {
      isLoading(false);
    }
  }
}
