import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:manage_apps/app/data/model/target_model.dart';

import '../controllers/edit_target_controller.dart';

class EditTargetView extends GetView<EditTargetController> {
  final Target? target = Get.arguments as Target?;

  EditTargetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(target?.id);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Target'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextFormField(
              initialValue: target?.name,
              onChanged: (value) {
                // Memperbarui nilai name di controller saat input berubah
                controller.nameController.text = value;
              },
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: target?.weight.toString(),
              onChanged: (value) {
                // Memperbarui nilai weight di controller saat input berubah
                controller.weightController.text = value;
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Weight',
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: target?.category,
              onChanged: (String? value) {
                controller.selectedCategory = value!;
              },
              items: controller.categoryOptions.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Category',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: DateFormat('dd/MM/yyyy').format(target!.startDate),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: target?.startDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  controller.startDateController.text =
                      DateFormat('dd/MM/yyyy').format(pickedDate);
                }
              },
              decoration: const InputDecoration(
                labelText: 'Start Date',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: DateFormat('dd/MM/yyyy').format(target!.endDate),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: target?.endDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  controller.endDateController.text =
                      DateFormat('dd/MM/yyyy').format(pickedDate);
                }
              },
              decoration: const InputDecoration(
                labelText: 'End Date',
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: target?.status,
              onChanged: (String? value) {
                controller.selectedStatus = value!;
              },
              items: controller.statusOptions.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Status',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Memperbarui nilai target sebelum menyimpan
                Target updatedTarget = Target(
                  id: target!.id,
                  name: controller.nameController.text,
                  category: controller.selectedCategory,
                  weight: int.tryParse(controller.weightController.text) ?? 0,
                  startDate: target!.startDate,
                  endDate: target!.endDate,
                  status: controller.selectedStatus,
                );
                // Memanggil fungsi editTarget dari controller
                controller.editTarget(updatedTarget);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
