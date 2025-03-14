import 'package:baridx_order_creation/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDefaultText extends StatelessWidget {
  final String text;
  final int? maxLine;
  final FontWeight fontWeight;
  final Color color;
  final double fontSize;
  final TextOverflow? overflow;
  final double? height;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final String? fontFamily;
  final TextDirection? textDirection;

  const AppDefaultText(
    this.text, {
    super.key,
    this.fontWeight = FontWeight.w300,
    this.color = AppColors.blackColor,
    this.fontSize = 16,
    this.overflow,
    this.height,
    this.textAlign,
    this.textDecoration,
    this.fontFamily = "Cairo",
    this.textDirection,
    this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      textAlign: textAlign,
      textDirection: textDirection,
      overflow: overflow,
      style: TextStyle(
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontSize: fontSize.sp,
        color: color,
        height: height,
        decoration: textDecoration,
      ),
    );
  }
}
