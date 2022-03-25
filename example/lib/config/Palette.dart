// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Palette {
  static final Palette palette = Palette._internal();

  static const Color scaffold = Color(0xFFF6F6F6);
  static const Color primaryColor = Color(0xffE10000);
  // static const Color primaryColor = Color(0xFF046c4e);
  static const Color themeColor = Color(0xFFF46C33);
  static const Color orage50 = Color(0xFFFAC4AD);
  static const Color textColor = Color(0xff505050);
  static const Color facebookBlue = Color(0xFF1777F2);
  static const Color heart = Color(0xFFEB4D4D);
  static const Color online = Color(0xFF4BCB1F);
  static const Color primary = Color(0xff1A89B9);
  static const Color sideBarColor = Color.fromRGBO(26, 137, 185, 0.81);
  static const Color bgColorError = Color(0xffC32323);
  static const Color bgColorInfo = Color(0xff26953E);
  static const Color bgError = Color(0xffFFE1E1);
  static const Color bgColorWarning = Color(0xffE29500);
  static const Color yellow63 = Color(0xffFDCE85);
  static const Color grey98 = Color(0xffFAFAFA);
  static const Color white = Color(0xffFFFFFF);
  static const Color orage = Color(0xffF3AC21);
  static const Color secondary = Color(0xff8BBE4A);
  static const Color red = Color(0xffCF2F2F);
  static const Color darkRed = Color(0xffE10000);
  static const Color darkRed46 = Color(0xffB12441);
  static const Color grey63 = Color(0xffA1A1A1);
  static const Color lightOrage = Color(0xffFFE8DB);
  static const Color charcoal = Color(0xff454545);
  static const Color grey46 = Color(0xff757575);
  static const Color grey90 = Color(0xffE5E5E5);
  static const Color moonstone = Color(0xff46A0C6);
  static const Color blue = Color(0xff2175F3);
  static const Color transparent = Colors.transparent;
  static const Color tabActive = Color(0xff4CBD80);
  static const Color tabInactive = Color(0xffB7B7B7);
  static const Color lightRed = Color(0xffEAEAEA);
  static const Color black = Color(0xff000000);
  static const Color seaShell = Color(0xffFFF8F4);
  static const Color grey = Color(0xffA2A2A2);
  static const Color gainsBoro = Color(0xffDCDCDC);
  static const Color lightOrange = Color(0xffF36F21);
  static const Color farbe = Color.fromRGBO(70, 160, 198, 0.1);
  static const Color seaShell1 = Color(0xffFFF4EE);
  static const Color lightGrey = Color(0xffEFEFEF);
  static const Color baliHai = Color(0xff919A9F);
  static const Color grey76 = Color(0xffC2C2C2);
  static const Color green = Colors.green;
  static const Color patternsBlue = Color(0xffD7EDF7);
  static const Color whiteSmoke = Color(0xffF5F5F5);
  static const Color whiteSmoke1 = Color(0xffF8F8F8);
  static const Color pacificBlue = Color(0xffD7EDF6);
  static const Color yellow = Color(0xffF3AC21);
  static const Color btnActive = Color(0xff16AB52);
  static const Color backgroundActive = Color(0xffD5F4E1);
  static const Color headerTitleBackground = Color(0xffECF5F9);
  static const LinearGradient gradientColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black26],
  );
  factory Palette() {
    return palette;
  }
  Palette._internal();
}
