import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/app_route.dart';
import 'core/dependency.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Sports Booking',
      initialRoute: AppRoute.splash,
      getPages: AppRoute.routes,
      initialBinding: DependencyInjection(),
    );
  }
}
