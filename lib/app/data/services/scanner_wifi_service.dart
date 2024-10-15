// import 'package:wifi_scan/wifi_scan.dart';
import 'dart:async';

import 'package:wifi_scan/wifi_scan.dart';

class ScannerWifiService {
  bool shouldCheckCan = true;

  Future<bool> startScan() async {
    // check if "can" startScan
    if (shouldCheckCan) {
      // check if can-startScan
      final can = await WiFiScan.instance.canStartScan();
      // if can-not, then show error
      if (can != CanStartScan.yes) {
        print("No se puede iniciar el escaneo: $can");

        return false;
      }
    }

    final result = await WiFiScan.instance.startScan();

    return result;
  }

  Future<bool> _canGetScannedResults() async {
    if (shouldCheckCan) {
      // check if can-getScannedResults
      final can = await WiFiScan.instance.canGetScannedResults();
      // if can-not, then show error
      if (can != CanGetScannedResults.yes) {
        print("No se pueden obtener los resultados del escaneo: $can");
        return false;
      }
    }
    return true;
  }

  Future<List<WiFiAccessPoint>> getScannedResults() async {
    if (await _canGetScannedResults()) {
      // get scanned results
      final results = await WiFiScan.instance.getScannedResults();
      return results;
    } else {
      return [];
    }
  }
}
