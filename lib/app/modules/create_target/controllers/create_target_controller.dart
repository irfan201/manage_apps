import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manage_apps/app/data/local/database_helper.dart';
import 'package:manage_apps/app/data/model/target_model.dart';
import 'package:manage_apps/app/modules/home/controllers/home_controller.dart';
import 'package:manage_apps/app/routes/app_pages.dart';

class CreateTargetController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController weightController;
  late TextEditingController startDateController;
  late TextEditingController endDateController;

  List<String> categoryOptions = [
    'Quantitative',
    'Qualitative',
  ].obs;

  List<String> statusOptions = [
    'to do',
    'in progress',
    'done',
  ].obs;

  String selectedCategory = 'Quantitative';
  String selectedStatus = 'to do';

  void saveTarget() async {
    String name = nameController.text;
    String category = selectedCategory;
    int weight = int.parse(weightController.text);
    DateTime startDate = DateTime.now(); // Ganti dengan nilai yang sesuai
    DateTime endDate = DateTime.parse(endDateController.text);
    String status = selectedStatus;

    Target target = Target(
      name: name,
      category: category,
      weight: weight,
      startDate: startDate,
      endDate: endDate,
      status: status,
    );

    int result = await DatabaseHelper().insertTarget(target);
    if (result != 0) {
      Get.snackbar('Success', 'Target saved successfully');
      HomeController homeController = Get.find();
      homeController.fetchTargets();
      Get.toNamed(Routes.HOME);
      // Tambahkan navigasi atau perintah lain sesuai kebutuhan
    } else {
      Get.snackbar('Error', 'Failed to save target');
    }
  }

  @override
  void onInit() {
    nameController = TextEditingController();
    weightController = TextEditingController();
    startDateController = TextEditingController();
    endDateController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    weightController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.onClose();
  }
}
