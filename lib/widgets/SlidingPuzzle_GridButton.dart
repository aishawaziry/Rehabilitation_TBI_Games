import 'package:flutter/material.dart';

class GridButton extends StatelessWidget {
  final String text;
  final VoidCallback click; // Use VoidCallback instead of Function

  GridButton(this.text, this.click);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: click,
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black, // Set text color to black
        ),
      ),
    );
  }
}
