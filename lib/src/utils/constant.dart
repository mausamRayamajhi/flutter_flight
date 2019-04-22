import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatCurrency = NumberFormat.simpleCurrency();

//FLIGHT LISTING.DART
final Color discountBackgroundColor = Color(0xFFFFE08D);
final Color flightBorderColor = Color(0xFFE6E6E6);
final Color chipBackgroundColor = Color(0xFFF6F6F6);

ThemeData appTheme =
    ThemeData(primaryColor: Color(0xFFF3791A), fontFamily: 'Oxygen');

const TextStyle dropDownLabelStyle =
    TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle dropDownMenuStyle =
    TextStyle(color: Colors.black, fontSize: 16.0);

var viewAllStyle = TextStyle(fontSize: 14.0, color: appTheme.primaryColor);

Color firstColor = Color(0xFFF47015);
Color secondColor = Color(0xFFEF772C);

var sizeBoxHeight =(dynamic height)=> SizedBox(
  height: height,
);

var sizeBoxWidth =(dynamic width)=> SizedBox(
  width: width,
);
