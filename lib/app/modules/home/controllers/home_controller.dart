
import 'package:get/get.dart';
import 'package:manage_apps/app/data/local/database_helper.dart';
import 'package:manage_apps/app/data/model/target_model.dart';

class HomeController extends GetxController {
   final RxList<Target> targets = <Target>[].obs;

  @override
  void onInit() {
   // Output: 0 (empty list
    fetchTargets();
     print(targets.length); 
    super.onInit();
  }

   Future<void> fetchTargets() async {
    List<Target> targetList = await DatabaseHelper().getTargets();
    targets.assignAll(targetList);
  }

  Future<void> deleteTarget(int id) async {
    await DatabaseHelper().deleteTarget(id);
    Get.showSnackbar(GetSnackBar(
      message: 'Target deleted successfully',
    ));
    fetchTargets();
  }



}
