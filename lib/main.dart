import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/bindings/auth_binding.dart';
import 'package:flutter_clean_instagram/app/routes/app_pages.dart';
import 'package:flutter_clean_instagram/app/ui/android/root/root_page.dart';
import 'package:flutter_clean_instagram/app/ui/theme/app_theme.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: appThemeData,
      initialBinding: AuthBinding(),
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      home: RootPage(),
    );
  }
}
