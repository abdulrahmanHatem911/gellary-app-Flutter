import 'package:flutter/material.dart';

import 'package:gellary_app/core/style/app_color.dart';

class TextFormComponent extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController controller;
  final Function(String)? validator;
  const TextFormComponent({
    required this.hintText,
    required this.keyboardType,
    required this.obscureText,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: AppColor.gray02),
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        errorStyle: const TextStyle(
          fontSize: 16.0,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          height: .9,
          color: AppColor.gray03,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 21.0,
          vertical: 15.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColor.gray01,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColor.gray01,
          ),
        ),
        fillColor: const Color(0xffF7F7F7),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColor.gray01,
          ),
        ),
      ),
      validator: validator as String? Function(String?)?,
    );
  }
}
