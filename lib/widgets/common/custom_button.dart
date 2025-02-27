import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final Color backgroundColor;
  final Color textColor;

  CustomButton({
    required this.text,
    required this.onPressed,
    this.icon,
    this.backgroundColor = Colors.grey,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: icon != null ? Icon(icon, color: textColor) : SizedBox.shrink(),
        label: Text(
          text,
          style: TextStyle(fontSize: 16, color: textColor),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
