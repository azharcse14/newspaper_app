import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

Widget addH(double h) {
  return SizedBox(height: h);
}

Widget addW(double w) {
  return SizedBox(width: w);
}

Widget customText({required String text, required double fontSize, required FontWeight fontWeight}){
  return Text(
    text,
    style: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}