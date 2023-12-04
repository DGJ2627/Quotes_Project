import 'package:final_project/views/screens/SplashScreens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import '../../../Theme/ThemeData.dart';


class Gautam extends StatelessWidget {
  const Gautam({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home:  SplashScreen(),
    );
  }
}