import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class Reminder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: buildCardList(context),
        ),
      ),
    );
  }

  Widget buildCardList(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 200,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildPaymentCardWidget(
              context,
              "assets/images/sun.png",
              "Sliding Puzzle",
              ["- Play game daily for 10-15 minutes", "- Total duration a week will be 60-90 minute"],
              [Color(0xFFb92b27), Color(0xFF1565c0)]),
                  SizedBox(
            width: 10,
          ),
          buildPaymentCardWidget(
              context,
              "assets/images/planet.png",
              "Match Cards",
              ["- Play game daily for 10-30 minutes", "- Total duration a week will be 60-120 minute"],
              [Color(0xFFFF9800), Color(0xFF9C2700)]),
       SizedBox(
            width: 10,
          ),
          buildPaymentCardWidget(
              context,
              "assets/images/moon.png",
              "Pattern Recognition",
              ["- Play game Weekly 3-5 times", "- Total duration a week will be 60-90 minute"],
              [Color(0xFF373b44), Color(0xFF4286f4), Color(0xFF2980b9)]),
          SizedBox(
            width: 10,
          ),
          buildPaymentCardWidget(
              context,
              "assets/images/shooting-star.png",
              "Sudoku",
              ["- Play game Weekly 3-7 times", "- Total duration a week will be 60-120 minute"],
              // #005aa7, #fffde4
              [Color(0xFFfffde4) ,Color(0xFF005aa7)]),
          SizedBox(
            width: 10,
          ),
          // Add other cards here
        ],
      ),
    );
  }

  Widget buildPaymentCardWidget(BuildContext context, String imagePath,
      String frontText, List<String> backText, List<Color> gradientColors) {
    return FlipCard(
      direction: FlipDirection.VERTICAL,
      front: buildFrontFace(context, imagePath, frontText, gradientColors),
      back: buildBackFace(context, backText, gradientColors,"assets/images/notification.png"),
    );
  }

  Widget buildFrontFace(BuildContext context, String imagePath, String text,
      List<Color> gradientColors) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                colors: gradientColors),
            borderRadius: BorderRadius.circular(15)),
        width: (MediaQuery.of(context).size.width) - 50,
        height: 200,
        child: Stack(
          children: [
            Positioned(
              bottom: 10,
              right: 25,
              child: Container(
                width: 60,
                height: 60,
                child: Image.asset(
                  imagePath,
                ),
              ),
            ),
           
            Positioned(
              top: 20,
              left: 25,
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

Widget buildBackFace(BuildContext context, List<String> text,
    List<Color> gradientColors, String imagePath) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomCenter,
              colors: gradientColors),
          borderRadius: BorderRadius.circular(15)),
      width: (MediaQuery.of(context).size.width) - 50,
      height: 200,
      child: Stack(
        children: [
          for (int i = 0; i < text.length; i++)
            Positioned(
              top: 20 + (i * 20).toDouble(),
              left: 25,
              child: Text(
                text[i],
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              width: 30,
              height: 30,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}