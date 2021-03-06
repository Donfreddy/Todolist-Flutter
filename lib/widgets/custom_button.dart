import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color color;
  final Color textColor;
  final Color borderColor;

  CustomButton(
      {@required this.onPressed,
      @required this.buttonText,
      this.color,
      this.textColor,
      this.borderColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      onPressed: onPressed,
      textColor: textColor,
      padding: const EdgeInsets.all(10.0),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 18),
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
