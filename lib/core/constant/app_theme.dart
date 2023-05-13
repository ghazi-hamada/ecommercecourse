import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
    fontFamily: "PlayfairDisplay",
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColor.primaryColor),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColor.primaryColor),
      titleTextStyle: const TextStyle(
          color: AppColor.primaryColor,
          fontWeight: FontWeight.bold,
          fontFamily: "PlayfairDisplay",
          fontSize: 25),
      backgroundColor: Colors.grey[50],
    ),
    textTheme: const TextTheme(
        // ignore: deprecated_member_use
        headline1: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
        // ignore: deprecated_member_use
        headline2: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
        // ignore: deprecated_member_use
        bodyText1: TextStyle(
            height: 2,
            color: AppColor.grey,
            fontWeight: FontWeight.bold,
            fontSize: 14),
        // ignore: deprecated_member_use
        bodyText2: TextStyle(height: 2, color: AppColor.grey, fontSize: 14)),
    primarySwatch: Colors.deepOrange);

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
      // ignore: deprecated_member_use
      headline1: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
      // ignore: deprecated_member_use
      headline2: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
      // ignore: deprecated_member_use
      bodyText1: TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      // ignore: deprecated_member_use
      bodyText2: TextStyle(height: 2, color: AppColor.grey, fontSize: 14)),
  primarySwatch: Colors.deepOrange,
);
