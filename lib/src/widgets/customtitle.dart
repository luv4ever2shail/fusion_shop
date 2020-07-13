import 'package:flutter/material.dart';
import 'package:fusion_shop/src/themes/light_color.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  const CustomTitleText(
      {Key key,
      this.text,
      this.fontSize = 18,
      this.color = AppColors.titleTextColor,
      this.fontWeight = FontWeight.w800})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.muli(
            fontSize: fontSize, fontWeight: fontWeight, color: color));
  }
}
