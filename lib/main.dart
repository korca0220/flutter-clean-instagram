import 'package:flutter/material.dart';
import 'package:flutter_clean_instargram/app/ui/android/home/home_page.dart';
import 'package:flutter_clean_instargram/app/ui/theme/app_theme.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: appThemeData,
      home: HomePage(),
    );
  }
}
