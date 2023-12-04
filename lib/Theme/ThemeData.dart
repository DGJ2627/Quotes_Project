import 'package:flutter/material.dart';

import 'custom_theme/AppbarTheme.dart';
import 'custom_theme/BottomSheetTheme.dart';
import 'custom_theme/CheckBoxTheme.dart';
import 'custom_theme/ChipTheme.dart';
import 'custom_theme/OutlineButtonTheme.dart';
import 'custom_theme/TextFieldTheme.dart';
import 'custom_theme/button_theme.dart';
import 'custom_theme/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: CustomTextTheme.lightTextTheme,
    chipTheme: CustomChipTheme.lightChipTheme,
    appBarTheme: CustomAppbarTheme.lightAppbarTheme,
    checkboxTheme: CustomCheckBoxTheme.lightCheckBoxTheme,
    bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: CustomElevButtonTheme.lightButtonTheme,
    outlinedButtonTheme: CustomOutlineButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: CustomTextFieldTheme.lightTextFieldTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: CustomTextTheme.darkTextTheme,
    chipTheme: CustomChipTheme.darkChipTheme,
    appBarTheme: CustomAppbarTheme.darkAppbarTheme,
    checkboxTheme: CustomCheckBoxTheme.darkCheckBoxTheme,
    bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: CustomElevButtonTheme.darkButtonTheme,
    outlinedButtonTheme: CustomOutlineButtonTheme.darkOutlineButtonTheme,
    inputDecorationTheme: CustomTextFieldTheme.darkTextFieldTheme,
  );
}