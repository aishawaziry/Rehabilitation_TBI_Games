import 'package:flutter/material.dart';
import 'package:rehab_hub/data/recommendation_data.dart';
import 'package:rehab_hub/model/recommendation_model.dart';
import 'package:rehab_hub/ui/shared/pattern_color.dart';
// import '../model/recommendation_model.dart';

class RecommendationCard extends StatefulWidget {
  final RecommendModel recommendation; // Pass the recommendation here
  const RecommendationCard({Key? key, required this.recommendation})
      : super(key: key);

  @override
  State<RecommendationCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<RecommendationCard> {
  String dropdownValue = 'Update Event';
  bool isBubbleExpanded = false;
  
  @override
  Widget build(BuildContext context) {
    var screen_H = MediaQuery.of(context).size.height;
  var screen_W = MediaQuery.of(context).size.width;
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: Colors.white,
      child:
          // padding: EdgeInsets.all(10),
          Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                colors: widget.recommendation.gradientColors!),
            borderRadius: BorderRadius.circular(30)),
        child: Column(children: [
          Container(
            height: screen_H/4,
            width: screen_W/3,
            child: Image.asset(
              widget.recommendation.explainImage!,
              fit: BoxFit.fill,
              //why does not it fit ??? -------------
            ),
          ),
          Container(
              color: Colors.transparent,
              height: 70,
              // decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: ListTile(
                title: Text(widget.recommendation.title!,
                    style: TextStyle(color: Colors.white)),
                // subtitle: Text(widget.recommendation.startDate,
                //     style: TextStyle(color: Color.fromARGB(66, 255, 255, 255))),
                // trailing: Container(
                //     height: 50,
                //     child:
                //         Image.asset('Energia_logo.png', fit: BoxFit.fitHeight)),
              )),
          Container(
            color: Colors.transparent,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text('For more Details',
                                style: TextStyle(
                                    color:
                                        Color.fromARGB(242, 255, 255, 255)))),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isBubbleExpanded =
                                  !isBubbleExpanded; // should expand?
                            });
                          },
                          icon: Icon(
                            isBubbleExpanded
                                ? Icons.arrow_circle_down_outlined
                                : Icons.arrow_circle_right_outlined,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                if (isBubbleExpanded)
                  eventdetails(content: widget.recommendation.content!),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class eventdetails extends StatelessWidget {
  final Map<String, String> content;
  eventdetails({
    required this.content,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: content.entries.map((entry) {
          return Container(
            padding: EdgeInsets.all(12),
            child: Text(
              '${entry.key}: ${entry.value}',
              style: TextStyle(color: Color.fromARGB(242, 255, 255, 255)),
            ),
          );
        }).toList(),
      ),
    );
  }
}
