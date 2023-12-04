import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Authentication/AuthenticationRepo.dart';
import '../../../model/DetailsModel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsModel data = Get.arguments as DetailsModel;
    final controller = Get.put(AuthenticationRepo());
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(
                data.name,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.output_rounded,
              ),
              title: const Text(
                "Logout",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onTap: () {
                controller.logOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
