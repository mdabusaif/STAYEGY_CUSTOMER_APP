import 'package:flutter/material.dart';

class SnackBarBuilder {
  void buildSnackBar(BuildContext context, {String message, Color color, Color textColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              message,
              style: TextStyle(color: textColor != null ? textColor : Colors.white),
            ),
            Icon(Icons.error)
          ],
        ),
        backgroundColor: color,
      ),
    );
  }
}
