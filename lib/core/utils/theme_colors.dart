import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
///
/// [ThemeColors] class is responsible for matching between the theme colors and the app colors
///
class ThemeColors {
  static Color getAppBarColor(BuildContext context) =>
      Theme.of(context).bottomAppBarColor;

  static Color getBottomNavigationBarColor(BuildContext context) =>
      Theme.of(context).bottomAppBarColor;

  static Color getCardTitleColor(BuildContext context) =>
      Theme.of(context).cardColor;

  static Color getBottomNavigationBarItemColor(BuildContext context) =>
      Theme.of(context).accentColor;

  static Color getBackgroundColor(BuildContext context) =>
      Theme.of(context).scaffoldBackgroundColor;

  static Color getPrimaryColor(BuildContext context) =>
      Theme.of(context).primaryColor;

  static Color getDarkTextColor(BuildContext context) =>
      Theme.of(context).textTheme.headline1!.color!;

  static Color getBlackTextColor(BuildContext context) =>
      Theme.of(context).textTheme.headline1!.color!;

  static Color getLightTextColor(BuildContext context) =>
      Theme.of(context).textTheme.headline2!.color!;

  static Color getBottomNavigationBarIconColor(BuildContext context) =>
      Theme.of(context).hoverColor;

  static Color getAlertTextColor(BuildContext context) =>
      Theme.of(context).disabledColor;

  static Color getNameColor(BuildContext context) =>
      Theme.of(context).canvasColor;
}
