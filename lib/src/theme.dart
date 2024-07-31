import 'package:flutter/material.dart';

const kPrimary = Color(0xFF516395);
const kPrimaryDark = Color(0xFF614385);
const kError = Color(0xFFFF1744);

ThemeData createTheme(BuildContext context) {
  final textTheme = Theme.of(context)
      .textTheme
      .copyWith(
        titleMedium: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: const TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.normal,
        ),
        labelMedium: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      )
      .apply(bodyColor: kPrimary, fontFamily: "Montserrat");

  return ThemeData(
    useMaterial3: true,
    primaryColorDark: kPrimaryDark,
    disabledColor: kPrimary.withOpacity(0.5),
    splashColor: kPrimary.withOpacity(0.5),
    dialogBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: kPrimary,
      error: kError,
      onSecondaryContainer: kPrimary,
      background: Colors.white,
    ),
    textTheme: textTheme,
    appBarTheme: AppBarTheme.of(context).copyWith(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: textTheme.bodyMedium,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w500,
        color: const Color(0xFFB8D6B0),
      ),
      fillColor: const Color(0xFFDAEDD5),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: kError, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: kError, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: kPrimary, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: kError,
      contentTextStyle: textTheme.labelMedium?.copyWith(color: kError),
    ),
  );
}
