import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/profil_bisnis_controller.dart';

class ProfilBisnisView extends GetView<ProfilBisnisController> {
  const ProfilBisnisView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                      "https://www.w3schools.com/w3images/avatar2.png"),
                ),
                const SizedBox(height: 10),
                const Text("Nama bisnis",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const Text("user@gmail.com",
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                SizedBox(height: Get.height * 0.05),
                const Text("Bisnis Sektor",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              
              ],
            ),
          ),
        ));
  }
}
