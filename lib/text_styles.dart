import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const headline1 = 24;
const headline2 = 22;
const headline3 = 20;
const headline4 = 18;
const headline5 = 16;
const headline6 = 14;
const headline7 = 12;
const eventTextColor = Color(0xff17a1a2);

TextStyle getEventHeaderTextStyle(
        {required double ts, Color color = eventTextColor}) =>
    GoogleFonts.poppins(
      fontSize: ts * headline4,
      color: color,
      fontWeight: FontWeight.w600,
      letterSpacing: .86,
    );

TextStyle getEventSubHeaderTextStyle(
        {required double ts, Color color = eventTextColor}) =>
    GoogleFonts.inter(
        fontSize: ts * headline7,
        color: color,
        fontWeight: FontWeight.w500,
        letterSpacing: .56);

TextStyle getEventSubHeaderBoldTextStyle(
        {required double ts, Color color = eventTextColor}) =>
    GoogleFonts.inter(
        fontSize: ts * headline7,
        color: color,
        fontWeight: FontWeight.w700,
        letterSpacing: .56);

