import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/light_theme_colors.dart';




abstract class AppTextStyle {
  ///Font Size
  static const double small_font_size = 11.0;
  static const double xSmall_font_size = 12.0;

  static const double regular_font_size = 13.0;
  static const double xRegular_font_size = 14.0;

  static const double medium_font_size = 16.0;
  static const double xMedium_font_size = 18.0;

  static const double large_font_size = 20.0;
  static const double xLarge_font_size = 32.0;

  static  TextStyle small_red =  GoogleFonts.tajawal(
      textStyle: TextStyle(color: Colors.redAccent, fontSize: small_font_size));

  static  TextStyle small_white =  GoogleFonts.tajawal(textStyle: TextStyle(color: Colors.white, fontSize: 9));

  static  TextStyle xMediumWhiteStyle =  GoogleFonts.tajawal(textStyle: TextStyle(color: Colors.white, fontSize: xMedium_font_size));

  static  TextStyle xMediumWhiteBoldStyle =  GoogleFonts.tajawal(textStyle: TextStyle(color: Colors.white, fontSize: xMedium_font_size, fontWeight: FontWeight.bold));

  static  TextStyle xLargeWhiteBoldStyle =  GoogleFonts.tajawal(textStyle: TextStyle(color: Colors.white, fontSize: xLarge_font_size, fontWeight: FontWeight.bold));

  static  TextStyle xLargeWhiteBold700Style =  GoogleFonts.tajawal(textStyle: TextStyle(color: Colors.white, fontSize: xLarge_font_size, fontWeight: FontWeight.w700));

  static  TextStyle xMediumGreyStyle =  GoogleFonts.tajawal(textStyle: TextStyle(color: Color(0xFF9D9D9D), fontSize: xMedium_font_size));

  static  TextStyle mediumGreyStyle =  GoogleFonts.tajawal(textStyle: TextStyle(color: Color(0xFF9D9D9D), fontSize: medium_font_size));

  static  TextStyle largeGreyBoldStyle =  GoogleFonts.tajawal(textStyle: TextStyle(color: Color(0xFF9D9D9D), fontSize: large_font_size, fontWeight: FontWeight.bold));

  static  TextStyle mediumDarkWithOpacityStyle =    GoogleFonts.tajawal(textStyle: TextStyle(
  color: LightThemeColors.textDarkColor.withOpacity(0.5),
  fontSize: 16,
  fontWeight: FontWeight.bold,
 
  ));


  static  TextStyle mediumSecondaryWithoutOpacityStyle =    GoogleFonts.tajawal(textStyle: TextStyle(
    color: LightThemeColors.secondaryHeaderColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,

  ));

  static  TextStyle mediumSecondaryWithoutOpacityStyleWith500Bold =    GoogleFonts.tajawal(textStyle: TextStyle(
    color: LightThemeColors.secondaryHeaderColor,
    fontSize: 18,
    fontWeight: FontWeight.w500,

  ));



  static  TextStyle mediumSecondaryWithOpacityStyle =    GoogleFonts.tajawal(textStyle: TextStyle(
    color: LightThemeColors.secondaryHeaderColor.withOpacity(0.5),
    fontSize: 16,
    fontWeight: FontWeight.bold,

  ));


  static  TextStyle mediumPrimaryWithOpacityStyle =    GoogleFonts.tajawal(textStyle: TextStyle(
    color: LightThemeColors.primaryColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,

  ));


  static  TextStyle largeDarkStyle =    GoogleFonts.tajawal(textStyle: TextStyle(
    color: LightThemeColors.textDarkColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ));


  static  TextStyle largePrimaryWithShadowStyle(context) =>   GoogleFonts.tajawal(textStyle: TextStyle(
      color: LightThemeColors.colorBlueText,
      fontSize: 28,
      fontWeight: FontWeight.bold,
      shadows: [Shadow(color: Colors.grey[50]!, offset: Offset(0,2))]
  ));

  static  TextStyle largeSecondaryWithShadowStyle(context) => GoogleFonts.tajawal(textStyle:  TextStyle(
      color: LightThemeColors.secondaryHeaderColor,
      fontSize: 28,
      fontWeight: FontWeight.bold,
      shadows: [Shadow(color: Colors.grey[50]!, offset: Offset(0,2))]
  ));

  static  TextStyle largeSecondaryStyle(context) => GoogleFonts.tajawal(textStyle:  TextStyle(
      color: LightThemeColors.secondaryHeaderColor,
      fontSize: 28,
      fontWeight: FontWeight.bold,
  ));

  static  TextStyle largeWhiteStyle(context) => GoogleFonts.tajawal(textStyle:  TextStyle(
    color: Theme.of(context).scaffoldBackgroundColor,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  ));

}
