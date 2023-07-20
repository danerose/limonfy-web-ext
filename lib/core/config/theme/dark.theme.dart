import 'package:flutter/material.dart';
import 'package:limonfy/app/injection.dart';
import 'package:limonfy/core/constants/colors.constants.dart';

final ThemeData limonfyDark = ThemeData(
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: ColorsConstants.background,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    primary: injector.get<ColorsConstants>().primary,
    seedColor: injector.get<ColorsConstants>().primary,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorsConstants.transparent,
    elevation: 0,
  ),
  iconTheme: const IconThemeData(color: ColorsConstants.white),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    elevation: 2,
    backgroundColor: injector.get<ColorsConstants>().primary,
    foregroundColor: ColorsConstants.textAlt,
    extendedIconLabelSpacing: 2,
    iconSize: 20,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0,
    backgroundColor: Colors.black.withOpacity(0.7),
    unselectedItemColor: ColorsConstants.grey,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      padding: const MaterialStatePropertyAll<EdgeInsets>(
        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      ),
      overlayColor: MaterialStatePropertyAll<Color>(
        injector.get<ColorsConstants>().primary.withOpacity(0.4),
      ),
      elevation: const MaterialStatePropertyAll<double>(0),
      side: MaterialStatePropertyAll<BorderSide>(
        BorderSide(width: 1.2, color: injector.get<ColorsConstants>().primary),
      ),
      foregroundColor: MaterialStatePropertyAll<Color>(
          injector.get<ColorsConstants>().primary),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: const MaterialStatePropertyAll<EdgeInsets>(
        EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
      ),
      elevation: const MaterialStatePropertyAll<double>(0),
      foregroundColor: const MaterialStatePropertyAll<Color>(
        ColorsConstants.black,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(5),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: injector.get<ColorsConstants>().primary,
        width: 1.5,
      ),
    ),
  ),
);
