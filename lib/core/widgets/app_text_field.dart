import 'package:baridx_order_creation/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nexFocusNode;
  final String? hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final void Function(String)? onChanged;
  final bool? enabled;
  final int? maxLength;
  final int? minLines;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final AutovalidateMode? autovalidateMode;

  const AppTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.nexFocusNode,
    this.hintText,
    this.borderColor,
    this.prefixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.inputFormatters,
    this.maxLines,
    this.onChanged,
    this.enabled,
    this.maxLength,
    this.minLines,
    this.maxLengthEnforcement,
    this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.primaryColor,
      focusNode: focusNode,
      onFieldSubmitted: (String value) {
        if (nexFocusNode != null) {
          FocusScope.of(context).requestFocus(nexFocusNode);
        }
      },
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: onChanged,
      keyboardType: keyboardType,
      validator: validator,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      maxLines: maxLines ?? 1,
      minLines: maxLines,
      enabled: enabled,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      style: TextStyle(
        color: AppColors.naturalDarkGray,
        fontFamily: "Cairo",
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
      ),
      cursorHeight: 20.0,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: maxLines != null ? 10.0 : 0.0,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFFA3A3A3),
          fontSize: 10,
          fontFamily: "Cairo",
        ),
        errorStyle: const TextStyle(
          fontSize: 10,
          fontFamily: "Cairo",
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? AppColors.naturalGray, width: 1.5),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? AppColors.naturalGray, width: 1.5),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
    );
  }
}
