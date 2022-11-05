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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColor.gray01,
        ),
        child: TextFormField(
          style: TextStyle(color: AppColor.gray02),
          keyboardType: keyboardType,
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              height: .9,
              color: AppColor.gray03,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                color: AppColor.gray01,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                color: AppColor.gray01,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                color: AppColor.gray01,
              ),
            ),
          ),
          validator: validator as String? Function(String?)?,
        ),
      ),
    );
  }
}
