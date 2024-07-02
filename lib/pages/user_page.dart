import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter_getx_getconnect/routes/route_name.dart';

import '../controllers/user_controller.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userC = Get.find<UserController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Users"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(RoutedName.adduserpage),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.all(10),
            child: userC.users.isEmpty
                ? const Center(
                    child: Text("Belum ada data"),
                  )
                : ListView.builder(
                    itemCount: userC.users.length,
                    itemBuilder: (context, i) => ListTile(
                      leading: const CircleAvatar(),
                      title: Text(
                        "${userC.users[i].name}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        "${userC.users[i].email}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: IconButton(
                        onPressed: () => userC.delete(userC.users[i].id),
                        icon: Icon(
                          Icons.delete_forever,
                          color: Colors.red[900],
                        ),
                      ),
                      onTap: () => Get.toNamed(
                        RoutedName.profilepage,
                        arguments: userC.users[i].id,
                      ),
                    ),
                  ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(RoutedName.adduserpage),
        child: const Icon(Icons.group_add_rounded),
      ),
    );
  }
}
