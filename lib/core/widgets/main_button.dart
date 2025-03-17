import 'package:baridx_order_creation/core/constants/dimensions.dart';
import 'package:baridx_order_creation/core/resources/app_colors.dart';
import 'package:baridx_order_creation/core/widgets/app_deafult_text.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final VoidCallback? onTap;
  final double? fontSize;
  final Widget? loadingWidget;

  const MainButton({
    super.key,
    required this.text,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.onTap,
    this.fontSize,
    this.loadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primaryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          border: Border.all(
            color: borderColor ?? AppColors.primaryColor,
          ),
        ),
        child: loadingWidget ??
            AppDefaultText(
              text,
              color: textColor ?? Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: fontSize ?? Dimensions.fontSize14Px,
            ),
      ),
    );
  }
}
