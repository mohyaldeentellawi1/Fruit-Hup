import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';

class CustomAuthTextFeild extends StatelessWidget {
  const CustomAuthTextFeild({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.keyboardType,
    this.obscureTex = true,
    this.onSaved,
  });

  final TextInputType? keyboardType;
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureTex;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureTex,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textFeildColor,
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: AppTextStyle.bold13.copyWith(color: Color(0xFF949D9E)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Color(0xFFE6E9EA)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Color(0xFFE6E9EA)),
        ),
      ),
    );
  }
}
