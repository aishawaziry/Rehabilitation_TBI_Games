import 'package:flutter/material.dart';
import 'SlidingPuzzle_ResetButton.dart';
import 'SlidingPuzzle_Move.dart';
import 'SlidingPuzzle_Time.dart';

class Menu extends StatelessWidget {
  final VoidCallback reset;
  final int move;
  final int secondsPassed;
  final Size size;

  Menu(this.reset, this.move, this.secondsPassed, this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ResetButton(reset, "Reset"), // Pass the reset function to the ResetButton
          Move(move),
          Time(secondsPassed),
        ],
      ),
    );
  }
}
