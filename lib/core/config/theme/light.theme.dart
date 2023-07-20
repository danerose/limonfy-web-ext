import 'package:flutter/material.dart';
import 'package:limonfy/app/injection.dart';
import 'package:limonfy/core/constants/colors.constants.dart';

final ThemeData limonfyLight = ThemeData(
  fontFamily: 'Poppins',
  colorScheme: ColorScheme.fromSeed(
    primary: injector.get<ColorsConstants>().primary,
    seedColor: injector.get<ColorsConstants>().primary,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: ColorsConstants.transparent,
    elevation: 0,
    actionsIconTheme: IconThemeData(
      color: injector.get<ColorsConstants>().input,
    ),
    iconTheme: IconThemeData(
      color: injector.get<ColorsConstants>().input,
    ),
    foregroundColor: ColorsConstants.textAlt,
  ),
  iconTheme: const IconThemeData(color: ColorsConstants.black),
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
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: ColorsConstants.black,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      padding: const MaterialStatePropertyAll<EdgeInsets>(
        EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
      ),
      overlayColor: MaterialStatePropertyAll<Color>(
        injector.get<ColorsConstants>().primary.withOpacity(0.4),
      ),
      elevation: const MaterialStatePropertyAll<double>(0),
      foregroundColor: MaterialStateColor.resolveWith((states) =>
          states.contains(MaterialState.disabled)
              ? ColorsConstants.disabled
              : ColorsConstants.black),
      side: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return const BorderSide(
              width: 1.5,
              color: ColorsConstants.disabled,
            );
          } else {
            return BorderSide(
              width: 1.5,
              color: injector.get<ColorsConstants>().primary,
            );
          }
        },
      ),
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
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0,
    selectedItemColor: injector.get<ColorsConstants>().input,
    unselectedItemColor: ColorsConstants.disabled,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: MaterialStatePropertyAll<Color>(
        injector.get<ColorsConstants>().input.withOpacity(0.2),
      ),
      foregroundColor: MaterialStateColor.resolveWith(
        (states) => states.contains(MaterialState.disabled)
            ? ColorsConstants.disabled
            : injector.get<ColorsConstants>().input,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: injector.get<ColorsConstants>().input,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    prefixIconColor: MaterialStateColor.resolveWith(
      (states) => states.contains(MaterialState.focused)
          ? injector.get<ColorsConstants>().input
          : ColorsConstants.grey,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(5),
    ),
    activeIndicatorBorder: BorderSide(
      color: injector.get<ColorsConstants>().second,
      width: 1.5,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: injector.get<ColorsConstants>().input,
        width: 1.5,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
  ),
);
