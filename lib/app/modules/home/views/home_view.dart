import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Material(
              elevation: 5,
              child: Container(
                  margin: EdgeInsets.only(top: context.mediaQueryPadding.top),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black38,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Target Bisnis",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      Material(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.green[300],
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.PROFIL_BISNIS);
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.targets.length,
                  itemBuilder: (context, index) {
                    final target = controller.targets[index];
                    return ListTile(
                      onTap: () {
                        Get.toNamed(Routes.DETAIL_TARGET, arguments: target);
                      },
                      leading: CircleAvatar(
                        backgroundColor: controller.targets[index].status ==
                                'to do'
                            ? Colors.red
                            : controller.targets[index].status == 'in progress'
                                ? Colors.blue
                                : Colors.green,
                        radius: 30,
                      ),
                      title: Text(target.name),
                      subtitle: Text(
                        "${DateFormat('dd/MM/yyyy').format(target.startDate)} - ${DateFormat('dd/MM/yyyy').format(target.endDate)}",
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.dialog(AlertDialog(
                                title: const Text('Delete Target'),
                                content: const Text(
                                    'Are you sure you want to delete this target?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                      controller.deleteTarget(
                                          controller.targets[index].id!);
                                    },
                                    child: const Text('Delete'),
                                  ),
                                ],
                              ));
                            },
                            icon: Icon(Icons.delete),
                          ),
                          IconButton(
                            onPressed: () {
                              Get.toNamed(Routes.EDIT_TARGET,
                                  arguments: controller.targets[index]);
                            },
                            icon: Icon(Icons.edit),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green[300],
          onPressed: () {
            Get.toNamed(Routes.CREATE_TARGET);
          },
          child: const Icon(Icons.add, color: Colors.white),
        ));
  }
}
