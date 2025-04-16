import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    this.bgColor,
    this.textColor,
    this.width,
    this.height,
    required this.submit,
    required this.name,
  });

  final String name;
  final VoidCallback submit;
  final Color? bgColor;
  final Color? textColor;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: submit,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? Colors.black,
        foregroundColor: textColor ?? Colors.white,
        minimumSize: Size(width ?? double.infinity, height ?? 40),
        side: const BorderSide(width: 1, color: Colors.black),
      ),
      child: Text(name),
    );
  }
}
