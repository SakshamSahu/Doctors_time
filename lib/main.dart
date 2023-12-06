import 'package:doctors_time/pages/get_started_page.dart';
import 'package:doctors_time/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: GetStartedPage.routeName,
      routes: AppRoutes.routes,
    );
  }
}
