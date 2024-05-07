import 'package:flutter/material.dart';
import 'package:rehab_hub/data/pattern_questions_shapes.dart';
import 'package:rehab_hub/screens/pattern_result_screen.dart';
import 'package:rehab_hub/ui/shared/pattern_color.dart';
// import 'package:pattern_recognition_game/widgets/pattern_quizz_widget.dart';
// import 'package:pattern_recognition_game/model/question_model.dart';

class ShapesScreen extends StatefulWidget {
  const ShapesScreen({Key? key}) : super(key: key);

  @override
  _QuizzScreenState createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<ShapesScreen> {
  int question_pos = 0;
  int score = 0;
  bool btnPressed = false;
  PageController? _controller;
  String btnText = "Next Question";
  bool answered = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    var screen_H = MediaQuery.of(context).size.height;
    Widget buildButton(int index, int i) {
      return Container(
        width: MediaQuery.of(context).size.width / 2 -
            (screen_H * 0.05), // Adjusted width for two buttons in a row
        height: screen_H * 0.11, // Adjusted height
        margin: EdgeInsets.only(
          bottom: screen_H * 0.02, // Adjusted margin
          left: screen_H * 0.01,
          right: screen_H * 0.01,
        ),
        child: RawMaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                screen_H * 0.013), // Adjusted border radius
          ),
          fillColor: btnPressed
              ? shapes[index].answers!.values.toList()[i]
                  ? Colors.green
                  : Colors.red
              : AppColor.secondaryColor,
          onPressed: !answered
              ? () {
                  if (shapes[index].answers!.values.toList()[i]) {
                    score++;
                    print("yes");
                  } else {
                    print("no");
                  }
                  setState(() {
                    btnPressed = true;
                    answered = true;
                  });
                }
              : null,
          child: Image.asset(
            'assets/images/${shapes[index].answers!.keys.toList()[i]}',
            fit: BoxFit.contain, // Adjust the fit based on your requirements
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColor.pripmaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screen_H * 0.02), // Adjusted padding
        child: PageView.builder(
          controller: _controller!,
          onPageChanged: (page) {
            if (page == shapes.length - 1) {
              setState(() {
                btnText = "See Results";
              });
            }
            setState(() {
              answered = false;
            });
          },
          physics: new NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Question ${index + 1}/10",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screen_H * 0.04, // Adjusted font size
                    ),
                  ),
                ),
                Divider(
                  color: Colors.white,
                  height: screen_H * 0.02, // Adjusted divider height
                  thickness: 1.0,
                ),
                SizedBox(
                  // height: screen_H * 0.03, // Adjusted height
                  child: Text(
                    'What is the next pattern?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screen_H * 0.044, // Adjusted font size
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: screen_H * 0.3, // Adjusted height
                  child: Image.asset(
                    'assets/images/${shapes[index].question}',
                    fit: BoxFit
                        .contain, // Adjust the fit based on your requirements
                  ),
                ),
                SizedBox(
                  height: screen_H * 0.02, // Adjusted height
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButton(index, 0),
                        buildButton(index, 1),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButton(index, 2),
                        buildButton(index, 3),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: screen_H * 0.02, // Adjusted height
                ),
                RawMaterialButton(
                  onPressed: () {
                    if (_controller!.page?.toInt() == shapes.length - 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(score),
                        ),
                      );
                    } else {
                      _controller!.nextPage(
                        duration: Duration(milliseconds: 250),
                        curve: Curves.easeInExpo,
                      );

                      setState(() {
                        btnPressed = false;
                      });
                    }
                  },
                  shape: StadiumBorder(),
                  fillColor: Colors.blue,
                  padding: EdgeInsets.symmetric(
                      vertical: screen_H * 0.01,
                      horizontal: screen_H * 0.03), // Adjusted padding
                  elevation: 0.0,
                  child: Text(
                    btnText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screen_H * 0.033, // Adjusted font size
                    ),
                  ),
                ),
              ],
            );
          },
          itemCount: shapes.length,
        ),
      ),
    );
  }
}
