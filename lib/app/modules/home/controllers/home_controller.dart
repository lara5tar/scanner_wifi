import 'dart:async';

import 'package:get/get.dart';
import 'package:scanner_wifi/app/data/services/scanner_wifi_service.dart';

class HomeController extends GetxController {
  var isCamion1Connected = false.obs;
  var isStartScan = false.obs;

  ScannerWifiService scannerWifiService = ScannerWifiService();

  @override
  void onInit() {
    super.onInit();
    startScan();
  }

  Future<void> startScan() async {
    while (true) {
      int seconds = 5;
      isStartScan.value = await scannerWifiService.startScan();
      if (isStartScan.value) {
        seconds = 1;
        final results = await scannerWifiService.getScannedResults();
        isCamion1Connected.value =
            results.any((element) => element.ssid == 'Camion01');
      }
      print("isStartScan: ${isStartScan.value}");
      print(
          '${DateTime.now().minute}:${DateTime.now().second}:${DateTime.now().millisecond}');
      await Future.delayed(Duration(seconds: seconds));
    }
  }
}
