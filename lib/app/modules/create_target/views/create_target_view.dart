import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_target_controller.dart';

class CreateTargetView extends GetView<CreateTargetController> {
  CreateTargetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CreateTarget'),
        centerTitle: true,
      ),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          Form(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller.nameController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 13, vertical: 9),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide:
                            BorderSide(color: Color(0xFFE9E9E9), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide:
                            BorderSide(color: Color(0xFFE9E9E9), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide:
                            BorderSide(color: Color(0xFFE9E9E9), width: 1),
                      ),
                      hintStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  TextFormField(
                    controller: controller.weightController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Weight',
                      hintText: 'weight',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 13, vertical: 9),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide:
                            BorderSide(color: Color(0xFFE9E9E9), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide:
                            BorderSide(color: Color(0xFFE9E9E9), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide:
                            BorderSide(color: Color(0xFFE9E9E9), width: 1),
                      ),
                      hintStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  
                  DropdownButtonFormField<String>(
                    value: controller.selectedCategory,
                    onChanged: (String? value) {
                      controller.selectedCategory = value!;
                    },
                    items: controller.categoryOptions.map((String option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please choose an option';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Category',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 13, vertical: 9),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide:
                            BorderSide(color: Color(0xFFE9E9E9), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide:
                            BorderSide(color: Color(0xFFE9E9E9), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide:
                            BorderSide(color: Color(0xFFE9E9E9), width: 1),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  TextFormField(
                    controller: controller.startDateController,
                    readOnly:
                        true, // Membuat input field tidak dapat diedit langsung
                    onTap: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime
                            .now(), // Tanggal awal yang ditampilkan di date picker
                        firstDate: DateTime(
                            2000), // Tanggal terawal yang dapat dipilih
                        lastDate: DateTime(
                            2100), // Tanggal terakhir yang dapat dipilih
                      );
                      if (selectedDate != null) {
                        controller.startDateController.text = selectedDate
                            .toString(); // Mengisi nilai input field dengan tanggal yang dipilih
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'start Date',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 13, vertical: 9),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide:
                            BorderSide(color: Color(0xFFE9E9E9), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide:
                            BorderSide(color: Color(0xFFE9E9E9), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide:
                            BorderSide(color: Color(0xFFE9E9E9), width: 1),
                      ),
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  TextFormField(
                    controller: controller.endDateController,
                    readOnly:
                        true, // Membuat input field tidak dapat diedit langsung
                    onTap: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime
                            .now(), // Tanggal awal yang ditampilkan di date picker
                        firstDate: DateTime(
                            2000), // Tanggal terawal yang dapat dipilih
                        lastDate: DateTime(
                            2100), // Tanggal terakhir yang dapat dipilih
                      );
                      if (selectedDate != null) {
                        controller.endDateController.text = selectedDate
                            .toString(); // Mengisi nilai input field dengan tanggal yang dipilih
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'end Date',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 13, vertical: 9),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide:
                            BorderSide(color: Color(0xFFE9E9E9), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide:
                            BorderSide(color: Color(0xFFE9E9E9), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide:
                            BorderSide(color: Color(0xFFE9E9E9), width: 1),
                      ),
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  DropdownButtonFormField<String>(
                    value: controller.selectedStatus,
                    onChanged: (String? value) {
                      controller.selectedStatus = value!;
                    },
                    items: controller.statusOptions.map((String option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please choose an option';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Status',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 13, vertical: 9),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide:
                            BorderSide(color: Color(0xFFE9E9E9), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide:
                            BorderSide(color: Color(0xFFE9E9E9), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide:
                            BorderSide(color: Color(0xFFE9E9E9), width: 1),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        controller.saveTarget();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[300],
                        minimumSize: MediaQuery.of(context).size.width >= 600
                            ? const Size(600, 53)
                            : const Size(360, 43),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Simpan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
