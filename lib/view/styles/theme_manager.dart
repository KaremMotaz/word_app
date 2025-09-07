import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_app/view/styles/color_manager.dart';

abstract class ThemeManager {
  static ThemeData getAppTheme() {
    return ThemeData(
      scaffoldBackgroundColor: ColorManager.black,
      appBarTheme: AppBarTheme(
        color: ColorManager.black,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: ColorManager.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.black,
        ),
      ),
    );
  }
}
