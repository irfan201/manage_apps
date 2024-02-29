import 'package:get/get.dart';

import '../controllers/edit_target_controller.dart';

class EditTargetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditTargetController>(
      () => EditTargetController(),
    );
  }
}
