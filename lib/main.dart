import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whales_technology/pages/home/home_page.dart';
import 'package:whales_technology/pages/home/home_binding.dart';
import 'package:whales_technology/routes/app_pages.dart';
import 'package:whales_technology/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: HomeBinding(),
      getPages: AppPages.routes,
      initialRoute: AppRoutes.Home_page,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
