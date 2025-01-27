import 'package:flutter/material.dart';
import './responsive_manager.dart';

abstract class AppTextStyles {
  /// <--------- Font size 10 ---------> ///
  static TextStyle regular10() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w400,
        fontSize: RM.data.mapSize(mobile: 10, tablet: 13, desktop: 15),
      );
  static TextStyle regular1() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w400,
        fontSize: RM.data.mapSize(mobile: 8, tablet: 8, desktop: 10),
      );
  static TextStyle regular2() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w400,
        fontSize: RM.data.mapSize(mobile: 6, tablet: 6, desktop: 7),
      );
  static TextStyle medium10() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w500,
        fontSize: RM.data.mapSize(mobile: 10, tablet: 13, desktop: 15),
      );
  static TextStyle semiBold10() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w600,
        fontSize: RM.data.mapSize(mobile: 10, tablet: 13, desktop: 15),
      );
  static TextStyle bold10() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w700,
        fontSize: RM.data.mapSize(mobile: 10, tablet: 13, desktop: 15),
      );

  /// <--------- Font size 12 ---------> ///
  static TextStyle regular12() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w400,
        fontSize: RM.data.mapSize(mobile: 12, tablet: 16, desktop: 18),
      );
  static TextStyle medium12() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w500,
        fontSize: RM.data.mapSize(mobile: 12, tablet: 16, desktop: 18),
      );
  static TextStyle semiBold12() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w600,
        fontSize: RM.data.mapSize(mobile: 12, tablet: 16, desktop: 18),
      );
  static TextStyle bold12() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w700,
        fontSize: RM.data.mapSize(mobile: 12, tablet: 16, desktop: 18),
      );

  /// <--------- Font size 14 ---------> ///
  static TextStyle regular14() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w400,
        fontSize: RM.data.mapSize(mobile: 14, tablet: 18, desktop: 20),
      );
  static TextStyle medium14() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w500,
        fontSize: RM.data.mapSize(mobile: 14, tablet: 18, desktop: 20),
      );
  static TextStyle semiBold14() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w600,
        fontSize: RM.data.mapSize(mobile: 14, tablet: 18, desktop: 20),
      );
  static TextStyle bold14() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w700,
        fontSize: RM.data.mapSize(mobile: 14, tablet: 18, desktop: 20),
      );

  /// <--------- Font size 16 ---------> ///
  static TextStyle regular16() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w400,
        fontSize: RM.data.mapSize(mobile: 16, tablet: 21, desktop: 24),
      );
  static TextStyle medium16() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w500,
        fontSize: RM.data.mapSize(mobile: 16, tablet: 21, desktop: 24),
      );
  static TextStyle semiBold16() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w600,
        fontSize: RM.data.mapSize(mobile: 16, tablet: 21, desktop: 24),
      );
  static TextStyle bold16() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w700,
        fontSize: RM.data.mapSize(mobile: 16, tablet: 21, desktop: 24),
      );

  /// <--------- Font size 18 ---------> ///
  static TextStyle regular18() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w400,
        fontSize: RM.data.mapSize(mobile: 18, tablet: 24, desktop: 26),
      );
  static TextStyle medium18() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w500,
        fontSize: RM.data.mapSize(mobile: 18, tablet: 24, desktop: 26),
      );
  static TextStyle semiBold18() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w600,
        fontSize: RM.data.mapSize(mobile: 18, tablet: 24, desktop: 26),
      );
  static TextStyle bold18() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w700,
        fontSize: RM.data.mapSize(mobile: 18, tablet: 24, desktop: 26),
      );

  /// <--------- Font size 20 ---------> ///
  static TextStyle regular20() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w400,
        fontSize: RM.data.mapSize(mobile: 20, tablet: 26, desktop: 28),
      );
  static TextStyle medium20() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w500,
        fontSize: RM.data.mapSize(mobile: 20, tablet: 26, desktop: 28),
      );
  static TextStyle semiBold20() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w600,
        fontSize: RM.data.mapSize(mobile: 20, tablet: 26, desktop: 28),
      );
  static TextStyle bold20() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w700,
        fontSize: RM.data.mapSize(mobile: 20, tablet: 26, desktop: 28),
      );

  /// <--------- Font size 22 ---------> ///
  static TextStyle regular22() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w400,
        fontSize: RM.data.mapSize(mobile: 22, tablet: 29, desktop: 31),
      );
  static TextStyle medium22() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w500,
        fontSize: RM.data.mapSize(mobile: 22, tablet: 29, desktop: 31),
      );
  static TextStyle semiBold22() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w600,
        fontSize: RM.data.mapSize(mobile: 22, tablet: 29, desktop: 31),
      );
  static TextStyle bold22() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w700,
        fontSize: RM.data.mapSize(mobile: 22, tablet: 29, desktop: 31),
      );

  /// <--------- Font size 24 ---------> ///
  static TextStyle regular24() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w400,
        fontSize: RM.data.mapSize(mobile: 24, tablet: 32, desktop: 34),
      );
  static TextStyle medium24() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w500,
        fontSize: RM.data.mapSize(mobile: 24, tablet: 32, desktop: 34),
      );
  static TextStyle semiBold24() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w600,
        fontSize: RM.data.mapSize(mobile: 24, tablet: 32, desktop: 34),
      );
  static TextStyle bold24() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w700,
        fontSize: RM.data.mapSize(mobile: 24, tablet: 32, desktop: 34),
      );

  /// <--------- Font size 28 ---------> ///
  static TextStyle regular28() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w400,
        fontSize: RM.data.mapSize(mobile: 28, tablet: 37, desktop: 40),
      );
  static TextStyle medium28() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w500,
        fontSize: RM.data.mapSize(mobile: 28, tablet: 37, desktop: 40),
      );
  static TextStyle semiBold28() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w600,
        fontSize: RM.data.mapSize(mobile: 28, tablet: 37, desktop: 40),
      );
  static TextStyle bold28() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w700,
        fontSize: RM.data.mapSize(mobile: 28, tablet: 37, desktop: 40),
      );

  /// <--------- Font size 34 ---------> ///
  static TextStyle regular34() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w400,
        fontSize: RM.data.mapSize(mobile: 34, tablet: 45, desktop: 47),
      );
  static TextStyle medium34() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w500,
        fontSize: RM.data.mapSize(mobile: 34, tablet: 45, desktop: 47),
      );
  static TextStyle semiBold34() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w600,
        fontSize: RM.data.mapSize(mobile: 34, tablet: 45, desktop: 47),
      );
  static TextStyle bold34() => TextStyle(
        // fontFamily: translatedNotoKufiArabic(),
        fontWeight: FontWeight.w700,
        fontSize: RM.data.mapSize(mobile: 34, tablet: 45, desktop: 47),
      );
}
