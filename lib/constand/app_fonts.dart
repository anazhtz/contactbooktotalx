import 'package:contactbooktotalx/constand/app_color.dart';
import 'package:flutter/material.dart';

class AppTypography {
  static const montserratThin = TextStyle(
      fontWeight: FontWeight.w100,
      fontFamily: 'Montserrat',
      color: Color(0xFF78828A));

  static const montserratThinItalic = TextStyle(
      fontWeight: FontWeight.w100,
      fontFamily: 'Montserrat',
      fontStyle: FontStyle.italic,
      color: Color(0xFF78828A));

  static const montserratRegular = TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: 'Montserrat',
      color: Color(0xFF11002C));

  static const montserratMedium = TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'Montserrat',
      color: Color(0xFF11002C));

  static const montserratMediumItalic = TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'Montserrat',
      fontStyle: FontStyle.italic,
      color: Color(0xFF11002C));

  static const montserratSemiBold = TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
      color: Color(0xFF11002C));

  static const montserratSemiBoldItalic = TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
      fontStyle: FontStyle.italic,
      color: Color(0xFF11002C));

// MAIN HEAD
  static const montserratBoldMainHead = TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
      fontSize: 25,
      color: Color(0xFF11002C));

// SUB HEAD
  static const montserratBoldSubHead = TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'Montserrat',
      color: Color(0xFF11002C));

// TITLE
  static TextStyle montserratMainTitle = TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'Montserrat',
      color: AppColors.primaryColor);
}
