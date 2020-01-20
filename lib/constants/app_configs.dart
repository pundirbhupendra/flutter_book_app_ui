import 'package:flutter/material.dart';

class AppConfigs {
  static double width;
  static double height;
  static init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
}
