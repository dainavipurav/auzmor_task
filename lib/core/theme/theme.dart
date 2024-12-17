import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainings/core/theme/colors.dart';

class AppTheme {
  static _border([Color color = AppColors.grey]) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: color),
      );

  static final _appbarTheme = AppBarTheme(
    titleSpacing: 20,
    backgroundColor: AppColors.primaryColor,
    centerTitle: false,
    elevation: 0,
    titleTextStyle: GoogleFonts.robotoSerif(
      color: AppColors.white,
      fontWeight: FontWeight.bold,
      fontSize: 28,
      letterSpacing: 1,
    ),
    actionsIconTheme: IconThemeData(
      size: 24,
      color: AppColors.white,
    ),
    iconTheme: IconThemeData(
      size: 24,
      color: AppColors.white,
    ),
  );

  static final _outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: AppColors.outlinedButtonTextColor!,
          width: 3,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      foregroundColor: AppColors.outlinedButtonTextColor,
      iconColor: AppColors.outlinedButtonTextColor,
      textStyle: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        color: AppColors.outlinedButtonTextColor,
      ),
    ),
  );
  static final _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      foregroundColor: AppColors.white,
      iconColor: AppColors.white,
      backgroundColor: AppColors.primaryColor,
      textStyle: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static final _textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      foregroundColor: AppColors.white,
      iconColor: AppColors.white,
      textStyle: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
      ),
      iconSize: 20,
    ),
  );

  static final _cardTheme = CardThemeData(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    color: AppColors.white,
    elevation: 1,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
  );

  static final _inputDecorationTheme = InputDecorationTheme(
    hintStyle: GoogleFonts.roboto(
      color: AppColors.grey,
    ),
    enabledBorder: _border(),
    focusedBorder: _border(AppColors.primaryColor),
    contentPadding: EdgeInsets.all(0),
  );

  static final _titleLarge = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: _appbarTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    textButtonTheme: _textButtonTheme,
    cardTheme: _cardTheme,
    inputDecorationTheme: _inputDecorationTheme,
    textTheme: GoogleFonts.poppinsTextTheme()
        .copyWith(
          titleLarge: _titleLarge,
        )
        .apply(
          bodyColor: AppColors.black,
          displayColor: AppColors.black,
          decorationColor: AppColors.black,
        ),
    dividerTheme: DividerThemeData(
      color: AppColors.lightGrey350,
    ),
  );
}
