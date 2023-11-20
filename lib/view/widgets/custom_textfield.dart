import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final List<TextInputFormatter>? formatter;
  final String hintText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Function()? onTap;
  final bool readOnly;
  final Function(String)? onChanged;
  const CustomTextField(
      {super.key,
      required this.controller,
      this.formatter,
      this.validator,
      this.suffixIcon,
      this.readOnly = false,
      this.onTap,
      this.onChanged,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: TextFormField(
        readOnly: readOnly,
        autovalidateMode: AutovalidateMode.always,
        inputFormatters: formatter,
        controller: controller,
        validator: validator,
        onTap: onTap,
        onChanged: onChanged,
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
            focusedErrorBorder: textFormBorder.copyWith(
                borderSide: const BorderSide(width: 0.5, color: Colors.red)),
            errorBorder: textFormBorder.copyWith(
                borderSide: const BorderSide(width: 0.5, color: Colors.red)),
            border: textFormBorder,
            focusedBorder: textFormBorder,
            enabledBorder: textFormBorder.copyWith(
              borderSide: const BorderSide(width: 0.5, color: Colors.green),
            )),
      ),
    );
  }
}

const textFormBorder = UnderlineInputBorder(borderSide: BorderSide(width: 0.5));
