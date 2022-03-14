import 'package:flutter/material.dart';
import 'dimensions.dart';

class CustomStyle {
  static var textStyle = TextStyle(
      color: Colors.white,
      fontSize: Dimensions.defaultTextSize
      
  );

  static var hintTextStyle = TextStyle(
      color: Colors.grey.withOpacity(0.5),
      fontSize: Dimensions.defaultTextSize
  );

  static var listStyle = TextStyle(
      color: Colors.white,
      fontSize: Dimensions.defaultTextSize,
  );

  static var defaultStyle = TextStyle(
      color: Colors.black,
      fontSize: Dimensions.largeTextSize
  );

  static var focusBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
  );

  static var focusErrorBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
  );

  static var searchBox = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  );
}