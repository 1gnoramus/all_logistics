import 'package:flutter/material.dart';

class ColourfulButton extends StatelessWidget {
  ColourfulButton(
      {required this.buttonColor,
      required this.onTap,
      required this.buttonText});

  final Color buttonColor;
  final VoidCallback onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.5),
      margin: EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.all(
          Radius.circular(13.0),
        ),
      ),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.black54),
        ),
      ),
    );
  }
}
