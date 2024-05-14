import 'package:flutter/material.dart';
import 'package:rehab_hub/data/recommendation_data.dart';
import 'package:rehab_hub/model/recommendation_model.dart';
import 'package:rehab_hub/widgets/recommendation_card.dart';

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({super.key});

  @override
  State<RecommendationPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  // GetEvent event = GetEvent();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // backgroundColor: AppBaseColour,
      //   title: Row(children: [
      //     Container(
      //         height: 55,
      //         padding: EdgeInsets.all(6),
      //         child: Image.asset(
      //           'Energia_logo.png',
      //           fit: BoxFit.fitHeight,
      //         )),
      //     Text('Energia')
      //   ]),
      // ),
      body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommends.length,
                  itemBuilder: (BuildContext context, int i) {
                    return RecommendationCard(recommendation: recommends[i],);
                  },
                ),
              )
    );
  }
}