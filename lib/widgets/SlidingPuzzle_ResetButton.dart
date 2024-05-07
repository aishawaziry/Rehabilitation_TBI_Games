import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  final VoidCallback reset;
  final String text;

  ResetButton(this.reset, this.text);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: reset,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Text(text,
    style: TextStyle(
    color: Colors.black,
    ),
      ),
    );
  }
}
