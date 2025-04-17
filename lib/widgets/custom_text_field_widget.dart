import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    this.label,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.validator,
    this.controller,
  });

  final Widget? label;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          hintText: hintText ?? '',
          label: label,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.deepPurpleAccent),
            borderRadius: BorderRadius.circular(30),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.only(left: 30)),
    );
  }
}
