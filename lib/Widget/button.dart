// Moh. Iqbal Waldan
// MI-2F
// 2031710139

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key key,
    this.title,
    this.action,
    this.textColor,
    this.backgroundColor,
    this.borderColor,
    this.radius,
  }) : super(key: key);

  final String title;
  final Function action;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
      child: ElevatedButton(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            color: textColor,
          ),
        ),
        style: ElevatedButton.styleFrom(
            primary: backgroundColor,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            side: BorderSide(width: 1, color: borderColor)),
        onPressed: action,
      ),
    );
  }
}
