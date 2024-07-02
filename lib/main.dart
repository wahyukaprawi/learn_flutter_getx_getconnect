import 'package:flutter/material.dart';
import 'package:learn_flutter_getx_getconnect/bindings/user_bindings.dart';
import 'package:learn_flutter_getx_getconnect/routes/all_page.dart';

import 'pages/user_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const UserPage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey)
      ),
      initialBinding: UserBindings(),
      getPages: AllPage.pages,
    );
  }
}