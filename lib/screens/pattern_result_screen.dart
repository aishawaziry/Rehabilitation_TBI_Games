import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rehab_hub/main.dart';
import 'package:rehab_hub/screens/pattern_main_menu.dart';
import 'package:rehab_hub/ui/shared/pattern_color.dart';

class ResultScreen extends StatefulWidget {
  int score;
  ResultScreen(this.score, {Key? key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColor.pripmaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              "Congratulations",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 45.0,
          ),
          Text(
            "You Score is",
            style: TextStyle(color: AppColor.pripmaryColor,fontWeight: FontWeight.bold, fontSize: 34.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "${widget.score}",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 85.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 100.0,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(
                StadiumBorder(),
              ),
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColor.secondaryColor),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.all(18.0),
              ),
            ),
            child: Text(
              "Return Home",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
