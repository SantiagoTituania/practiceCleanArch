import 'package:flutter/material.dart';
import 'package:practice_clean_arch/ui/componentes/theme/app_theme.dart';

class InputDecorations {
  static InputDecoration authInputDecoration(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon}) {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppTheme.secondColor),
      ),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppTheme.secondColor, width: 2)),
      hintText: hintText,
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.grey),
      prefixIcon: prefixIcon != null
          ? Icon(prefixIcon, color: AppTheme.primaryColor)
          : null,
    );
  }
}
