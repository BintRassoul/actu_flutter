import 'package:flutter/material.dart';
import 'package:my_actu/core/theme/colors.dart';
import 'package:my_actu/core/theme/styles.dart';

class AppTheme {
  late ThemeData lightTheme;
  late ThemeData darkTheme;

  /// Constructs an [AppTheme].
  AppTheme() {
    lightTheme = ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Inter',
      useMaterial3: true,
      hoverColor: AppColors.cardBackground,
      hintColor: AppColors.darkGray.withOpacity(.44),
      highlightColor: AppColors.veryLightGray,
      primaryColor: AppColors.golden,
      primaryColorDark: AppColors.golden,
      scaffoldBackgroundColor: AppColors.white, //AppColors.veryLightGray,
      cardColor: AppColors.veryLightGray,
      dividerColor: AppColors.veryLightGray,

      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.white,
        modalBackgroundColor: AppColors.white,
      ),
      dropdownMenuTheme: const DropdownMenuThemeData(
        textStyle: TextStyle(
          fontSize: 12,
          color: AppColors.darkGray,
          fontWeight: FontWeight.w600,
        ),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: AppColors.darkGray,
        // elevation: 4,
        //scrolledUnderElevation: 0,

        titleTextStyle: Style().titleTextStyle(),
      ),
      drawerTheme: const DrawerThemeData(backgroundColor: AppColors.white),
      colorScheme: const ColorScheme.light(
        background: AppColors.veryLightGray,
        onBackground: AppColors.darkGray,
        primary: AppColors.golden,
        onPrimary: AppColors.darkGray,
        secondary: AppColors.black,
        onSecondary: AppColors.ligthGray,
        tertiary: AppColors.gray,
        primaryContainer: AppColors.azul,
        // tertiary: AppColors.ligthGray,
        secondaryContainer: AppColors.cardBackground,
        onTertiary: AppColors.veryLightGray, //AppColors.cardBackground,
        surface: AppColors.veryLightGray,
        onSurface: AppColors.darkGray,
        onPrimaryContainer: AppColors.gray1,
        onSecondaryContainer: AppColors.base,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        // unselectedLabelStyle: TextStyle(color: Color(ZZZ)),
        backgroundColor: AppColors.white,
        unselectedItemColor: AppColors.gray2,
      ),
      textTheme: TextTheme(
        bodySmall: const TextStyle(
          fontSize: 12,
          color: AppColors.golden,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: const TextStyle(
          fontSize: 14,
          color: AppColors.golden,
          fontWeight: FontWeight.w500,
        ),

        titleSmall: const TextStyle(
          fontSize: 12,
          color: AppColors.gray,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: const TextStyle(
          fontSize: 12,
          color: AppColors.darkGray,
          fontWeight: FontWeight.w600,
        ),

        titleMedium: const TextStyle(
            fontSize: 14,
            color: AppColors.darkGray,
            fontWeight: FontWeight.w400),
        titleLarge: const TextStyle(
            fontSize: 16,
            color: AppColors.darkGray,
            fontWeight: FontWeight.w600),
        headlineSmall: const TextStyle(
            fontSize: 14,
            color: AppColors.darkGray,
            fontWeight: FontWeight.w700),
        displaySmall: Typography.blackCupertino
            .displaySmall, //TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        // bodyLarge: const TextStyle(fontSize: 18, color: Colors.white70),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: false,
        fillColor: Colors.transparent,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintStyle: Style().textStyle(
          color: AppColors.ligthGray,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.ligthGray,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.ligthGray,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red,
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.golden,
        foregroundColor: AppColors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.golden,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          minimumSize: const Size.fromHeight(60),
          foregroundColor: AppColors.white,
        ),
      ),
    );
//-----------------------------DARK THEME----------------------------------
    darkTheme = ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'Inter',
      primaryColor: AppColors.golden,
      primaryColorDark: AppColors.goldenDark,
      primaryColorLight: Colors.white,
      hintColor: AppColors.ligthGray.withOpacity(.44),
      highlightColor: AppColors.veryLightGray,
      hoverColor: AppColors.ligthGray.withOpacity(.27),
      scaffoldBackgroundColor: AppColors.darkGray, //: AppColors.gray2,
      cardColor: AppColors.ligthGray,
      dividerColor: AppColors.darkGray,
      useMaterial3: true,

      drawerTheme:
          const DrawerThemeData(backgroundColor: AppColors.veryLightGray),

      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.darkGray, //.withOpacity(.63),
        modalBackgroundColor: AppColors.cardBackground.withOpacity(.63),
      ),
      dropdownMenuTheme: const DropdownMenuThemeData(
        textStyle: TextStyle(
            fontSize: 12,
            color: AppColors.ligthGray,
            fontWeight: FontWeight.w600),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkGray,
        shadowColor: AppColors.black,
        //scrolledUnderElevation: 0,
        titleTextStyle: Style().titleTextStyle(),
      ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          // unselectedLabelStyle: TextStyle(color: Color(ZZZ)),
          backgroundColor: AppColors.darkGray,
          unselectedItemColor: AppColors.ligthGray),
      colorScheme: const ColorScheme.dark(
        background: AppColors.gray,
        onBackground: AppColors.veryLightGray,
        primary: AppColors.golden,
        // primary: AppColors.goldenDark,
        onPrimary: AppColors.ligthGray,
        // secondary: AppColors.golden,
        secondary: AppColors.white,

        onSecondary: AppColors.darkGray,
        secondaryContainer: AppColors.darkGray,
        primaryContainer: AppColors.golden,
        // tertiary: AppColors.ligthGray,
        tertiary: AppColors.veryLightGray,

        onTertiary:
            AppColors.darkGray, //AppColors.cardBackground.withOpacity(.63),
        surface: AppColors.gray,
        onSurface: AppColors.darkGray,
        onPrimaryContainer: AppColors.gray,
        onSecondaryContainer: AppColors.golden,
      ),
      textTheme: const TextTheme(
        bodySmall: TextStyle(
            fontSize: 12, color: AppColors.golden, fontWeight: FontWeight.w400),
        bodyMedium: TextStyle(
            fontSize: 14, color: AppColors.golden, fontWeight: FontWeight.w500),
        titleSmall: TextStyle(
            fontSize: 12,
            color: AppColors.veryLightGray,
            fontWeight: FontWeight.w400),
        titleMedium: TextStyle(
            fontSize: 14,
            color: AppColors.veryLightGray,
            fontWeight: FontWeight.w400),
        headlineSmall: TextStyle(
            fontSize: 14,
            color: AppColors.veryLightGray,
            fontWeight: FontWeight.w700),
        titleLarge: TextStyle(
            fontSize: 16,
            color: AppColors.veryLightGray,
            fontWeight: FontWeight.w600),
        labelSmall: TextStyle(
            fontSize: 12,
            color: AppColors.ligthGray,
            fontWeight: FontWeight.w600),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        labelStyle: TextStyle(
          color: Colors.black,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          minimumSize: const Size.fromHeight(60),
          foregroundColor: Colors.white,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.golden,
        foregroundColor: Colors.white,
      ),
    );
  }
}
