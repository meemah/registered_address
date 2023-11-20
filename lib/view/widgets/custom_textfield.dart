import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final List<TextInputFormatter>? formatter;
  final String hintText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  const CustomTextField(
      {super.key,
      required this.controller,
      this.formatter,
      this.validator,
      this.suffixIcon,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.always,
      inputFormatters: formatter,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        suffixIconConstraints: BoxConstraints(
          maxHeight: 25.h,
          minHeight: 25.h,
          minWidth: 25.w,
        ),
        suffixIcon: suffixIcon ??
            Padding(
                padding: const EdgeInsets.only(
                  right: 14,
                ),
                child: suffixIcon),

        hintText: hintText,
        // enabledBorder: outlineInputBorder.copyWith(
        //   borderRadius: BorderRadius.circular(radius.r),
        // ),
        // hintStyle: KebleTextStyle.norlmalTextRegular(
        //     fontWeight: FontWeight.w800, color: KebleColors.greyScale11),
        // contentPadding:
        //     const EdgeInsets.symmetric(horizontal: 14.0, vertical: 13),
        // border: outlineInputBorder.copyWith(
        //   borderRadius: BorderRadius.circular(radius.r),
        // ),
        // focusedBorder: outlineInputBorder.copyWith(
        //     borderRadius: BorderRadius.circular(radius.r),
        //     borderSide: const BorderSide(color: KebleColors.primaryColor)),
      ),
    );
  }
}