import '../utils/style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.backgroundColor,
      required this.textColor,
      this.borderRadius,
      required this.text,
      this.fontSize,required this.onPressed});
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String text;
  final double? fontSize;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
            fontSize: fontSize,
            color: textColor,
            fontWeight: FontWeight.w900,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
