import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter_getx_getconnect/controllers/add_controller.dart';
import 'package:learn_flutter_getx_getconnect/controllers/user_controller.dart';

class AdduserPage extends StatelessWidget {
  final addC = Get.find<AddController>();
  final userC = Get.find<UserController>();
  AdduserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add User"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              TextField(
                controller: addC.nameC,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: addC.emailC,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: "Email Address",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: addC.phoneC,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(),
                ),
                onEditingComplete: () => userC.add(
                  addC.nameC.text,
                  addC.emailC.text,
                  addC.phoneC.text,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => userC.add(
                  addC.nameC.text,
                  addC.emailC.text,
                  addC.phoneC.text,
                ),
                child: const Text("ADD USER"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
