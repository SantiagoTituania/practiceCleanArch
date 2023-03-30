import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';

class AppTheme {
  static Color primaryColor = const Color.fromRGBO(172, 30, 35, 1);
  static Color primaryColorOpacity = Color.fromARGB(255, 215, 101, 105);
  static Color secondColor = globalIsDarkSelected
      ? const Color.fromRGBO(245, 245, 245, 1)
      : const Color.fromRGBO(89, 89, 89, 1);
  static Color backgorundColor = globalIsDarkSelected
      ? const Color.fromRGBO(26, 26, 26, 1)
      : const Color.fromRGBO(245, 245, 245, 1);
  static Color succesulColor = const Color.fromRGBO(102, 187, 106, 1);
  static Color errorColor = const Color.fromRGBO(229, 115, 115, 1);
  static Color alertColor = const Color.fromRGBO(255, 202, 40, 1);
  static Color itemMenuColor = globalIsDarkSelected
      ? const Color.fromRGBO(245, 245, 245, 1)
      : const Color.fromRGBO(89, 89, 89, 1);
  static Color itemMenuSelectedColor = const Color.fromRGBO(172, 30, 35, 1);
  static Color cardColor = globalIsDarkSelected
      ? const Color.fromRGBO(40, 40, 40, 1)
      : const Color.fromRGBO(245, 245, 245, 1);
  static Color textColor = globalIsDarkSelected
      ? const Color.fromRGBO(175, 175, 175, 1)
      : Color.fromARGB(255, 60, 60, 60);

  static final ThemeData theme = ThemeData.light().copyWith(
      //Definir el color primario de la aplicacion
      primaryColor: primaryColor,

      //Definir el diseño de todos los AppBars
      appBarTheme: AppBarTheme(
        foregroundColor: secondColor,
        color: backgorundColor,
        elevation: 5,
      ),

      //Definir el diseño de todos los botones
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: backgorundColor, foregroundColor: secondColor),
      ),

      //Definir el diseño para todos los botones flotantes
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColor, elevation: 10),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgorundColor,
          foregroundColor: textColor,
          elevation: 4,
        ),
      ),

      //Definir el estilo para todos los inputs
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: primaryColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      ),

      //definir el color del fondo de pantalla
      scaffoldBackgroundColor: backgorundColor,
      //definir el tipo de letra para toda la aplicacion
      //textTheme: GoogleFonts.poppinsTextTheme().apply(bodyColor: textColor),

      //textTheme: GoogleFonts.getFont('Poppins'),

      textTheme:
          GoogleFonts.getTextTheme('Poppins').apply(bodyColor: textColor),
      cardTheme: CardTheme(
        elevation: 10,
        color: cardColor,
      ));
}
