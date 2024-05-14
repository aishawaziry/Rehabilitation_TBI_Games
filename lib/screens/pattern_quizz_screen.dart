import 'package:flutter/material.dart';
import 'package:rehab_hub/data/pattern_questions_numbers.dart';
import 'package:rehab_hub/screens/pattern_result_screen.dart';
import 'package:rehab_hub/ui/shared/pattern_color.dart';
// import 'package:pattern_recognition_game/widgets/pattern_quizz_widget.dart';
// import 'package:pattern_recognition_game/model/question_model.dart';

class QuizzScreen extends StatefulWidget {
  const QuizzScreen({Key? key}) : super(key: key);

  @override
  _QuizzScreenState createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {
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
    return Scaffold(
      // backgroundColor: AppColor.pripmaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screen_H * 0.02), // Adjusted padding
        child: PageView.builder(
          controller: _controller!,
          onPageChanged: (page) {
            if (page == numbers.length - 1) {
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
                      color: AppColor.pripmaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: screen_H * 0.04, // Adjusted font size
                    ),
                  ),
                ),
                Divider(
                  color: AppColor.secondaryColor,
                  height: screen_H * 0.02, // Adjusted divider height
                  thickness: 1.0,
                ),
                SizedBox(
                  height: screen_H * 0.03, // Adjusted height
                ),
                SizedBox(
                  width: double.infinity,
                  height: screen_H * 0.3, // Adjusted height
                  child: Text(
                    "${numbers[index].question}",
                    style: TextStyle(
                      color: AppColor.pripmaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: screen_H * 0.044, // Adjusted font size
                    ),
                  ),
                ),
                for (int i = 0;
                    i < numbers[index].answers!.length;
                    i++)
                  Container(
                    width: double.infinity,
                    height: screen_H * 0.07, // Adjusted height
                    margin: EdgeInsets.only(
                      bottom: screen_H * 0.03, // Adjusted margin
                      left: screen_H * 0.01,
                      right: screen_H * 0.01,
                    ),
                    child: RawMaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(screen_H * 0.013), // Adjusted border radius
                      ),
                      fillColor: btnPressed
                          ? numbers[index]
                                  .answers!
                                  .values
                                  .toList()[i]
                              ? Colors.green
                              : Colors.red
                          : AppColor.secondaryColor,
                      onPressed: !answered
                          ? () {
                              if (numbers[index]
                                  .answers!
                                  .values
                                  .toList()[i]) {
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
                      child: Text(
                        numbers[index].answers!.keys.toList()[i],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screen_H * 0.033, // Adjusted font size
                        ),
                      ),
                    ),
                  ),
                SizedBox(
                  height: screen_H * 0.08, // Adjusted height
                ),
                RawMaterialButton(
                  onPressed: () {
                    if (_controller!.page?.toInt() == numbers.length - 1) {
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
                  padding: EdgeInsets.symmetric(vertical: screen_H * 0.02, horizontal: screen_H * 0.03), // Adjusted padding
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
          itemCount: numbers.length,
        ),
      ),
    );
  }
}
