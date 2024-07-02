import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter_getx_getconnect/controllers/profile_controller.dart';

import '../controllers/user_controller.dart';
import '../models/user.dart';

class ProfilePage extends StatelessWidget {
  final profileC = Get.find<ProfileController>();
  final userC = Get.find<UserController>();
  final String uid = Get.arguments;

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = userC.userById(uid);
    profileC.nameC.text = user.name!;
    profileC.emailC.text = user.email!;
    profileC.phoneC.text = user.phone!;

    return Scaffold(
      appBar: AppBar(
        title: const Text("PROFILE"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () => userC.delete(uid).then(
              (deleted) {
                if (deleted) Get.back();
              },
            ),
            icon: const Icon(Icons.delete_forever),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              TextField(
                controller: profileC.nameC,
                autocorrect: false,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: profileC.emailC,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: profileC.phoneC,
                autocorrect: false,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onEditingComplete: () => userC.edit(
                  uid,
                  profileC.nameC.text,
                  profileC.emailC.text,
                  profileC.phoneC.text,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => userC.edit(
                  uid,
                  profileC.nameC.text,
                  profileC.emailC.text,
                  profileC.phoneC.text,
                ),
                child: const Text("UPDATE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}