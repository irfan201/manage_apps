import 'package:get/get.dart';

import '../controllers/profil_bisnis_controller.dart';

class ProfilBisnisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilBisnisController>(
      () => ProfilBisnisController(),
    );
  }
}
