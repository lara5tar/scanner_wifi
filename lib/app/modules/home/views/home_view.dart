import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scanner_wifi/app/data/services/scanner_wifi_service.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WiFi Listener'),
      ),
      body: Center(
        child: Obx(() {
          // Cambia la UI basado en si el WiFi "camion1" está conectado o no
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                controller.isStartScan.value
                    ? "Escaneando..."
                    : "No se puede iniciar el escaneo",
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              Text(
                controller.isCamion1Connected.value
                    ? "Camion 1 está conectado"
                    : "Camion 1 no está conectado",
                style: const TextStyle(fontSize: 24),
              ),
            ],
          );
        }),
      ),
    );
  }
}
