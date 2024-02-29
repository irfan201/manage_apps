import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manage_apps/app/data/local/database_helper.dart';
import 'package:manage_apps/app/modules/home/controllers/home_controller.dart';
import 'package:manage_apps/app/routes/app_pages.dart';

import '../../../data/model/target_model.dart';

class EditTargetController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController weightController;
  late TextEditingController startDateController;
  late TextEditingController endDateController;

  List<String> categoryOptions = ['Quantitative', 'Qualitative'];
  List<String> statusOptions = ['to do', 'in progress', 'done'];

  String selectedCategory = 'Quantitative';
  String selectedStatus = 'to do';

  Future<void> editTarget(Target target) async {
    // Mendapatkan database
    final DatabaseHelper databaseHelper = DatabaseHelper();
    // Mengupdate target di database
    int result = await databaseHelper.updateTarget(target);
    if (result != 0) {
      // Jika berhasil, tampilkan snackbar
      Get.snackbar('Success', 'Target edited successfully');
      // Navigasi ke halaman home
      HomeController homeController = Get.find();
      homeController.fetchTargets();
      Get.offAllNamed(Routes.HOME);
    } else {
      // Jika gagal, tampilkan snackbar
      Get.snackbar('Error', 'Failed to edit target');
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
