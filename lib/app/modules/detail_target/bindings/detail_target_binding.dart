import 'package:get/get.dart';

import '../controllers/detail_target_controller.dart';

class DetailTargetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailTargetController>(
      () => DetailTargetController(),
    );
  }
}
