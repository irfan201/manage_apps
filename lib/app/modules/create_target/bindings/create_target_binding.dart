import 'package:get/get.dart';

import '../controllers/create_target_controller.dart';

class CreateTargetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateTargetController>(
      () => CreateTargetController(),
    );
  }
}
