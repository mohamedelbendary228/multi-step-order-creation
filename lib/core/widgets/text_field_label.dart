import 'package:baridx_order_creation/core/resources/app_colors.dart';
import 'package:baridx_order_creation/core/widgets/app_deafult_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldLabel extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;

  const TextFieldLabel(
    this.text, {
    super.key,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return AppDefaultText(
      text,
      color: AppColors.blackColor,
      fontSize: fontSize?.sp ?? 12.sp,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }
}
