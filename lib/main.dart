import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_instagram/app/bindings/init_binding.dart';
import 'package:flutter_clean_instagram/app/routes/app_pages.dart';
import 'package:flutter_clean_instagram/app/ui/android/root/root_page.dart';
import 'package:flutter_clean_instagram/app/ui/theme/app_theme.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChannels.skia
      .invokeMethod<void>('setResourceCacheMaxBytes', 512 * (1 << 20));
  SystemChannels.skia
      .invokeMethod<void>('Skia.setResourceCacheMaxBytes', 512 * (1 << 20));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: appThemeData,
      initialBinding: InitBinding(),
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      home: RootPage(),
    );
  }
}
