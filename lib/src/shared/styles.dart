import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

// TextStyle
TextStyle mainRegularTextStyle = GoogleFonts.inter(
  color: BaseColors.primary,
);

TextStyle mainSemiBoldTextStyle =
    GoogleFonts.inter(color: BaseColors.primary, fontWeight: semiBold);

TextStyle mainBoldTextStyle =
    GoogleFonts.inter(color: BaseColors.primary, fontWeight: bold);

TextStyle blackRegularTextStyle = GoogleFonts.inter(color: BaseColors.black);

TextStyle blackSemiBoldTextStyle =
    GoogleFonts.inter(color: BaseColors.black, fontWeight: semiBold);

TextStyle blackBoldTextStyle =
    GoogleFonts.inter(color: BaseColors.black, fontWeight: bold);

TextStyle whiteRegularTextStyle = GoogleFonts.inter(color: BaseColors.white);

TextStyle whiteSemiBoldTextStyle =
    GoogleFonts.inter(color: BaseColors.white, fontWeight: semiBold);

TextStyle whiteBoldTextStyle =
    GoogleFonts.inter(color: BaseColors.white, fontWeight: bold);

FontWeight light = FontWeight.w300;
FontWeight reguler = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
