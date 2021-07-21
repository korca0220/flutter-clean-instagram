import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/ui/theme/app_text_theme.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    headline3: loginTitleTextstyle,
  ),
  canvasColor: Colors.transparent,
);

final BoxDecoration defaultBoxDecoration = BoxDecoration(
  border: Border.all(
    width: 1.0,
    color: Colors.grey[400],
  ),
  borderRadius: BorderRadius.circular(8),
);
