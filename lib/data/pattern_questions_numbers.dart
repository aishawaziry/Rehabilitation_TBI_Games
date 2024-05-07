// import 'package:Rehabilitation_TBI_Games/model/pattern_question_model.dart';
import 'package:rehab_hub/model/pattern_question_model.dart';

List<QuestionModel> numbers = [
  QuestionModel(
    "Complete the pattern: 2, 4, 6, ?",
    {
      "7": false,
      "8": true,
      "9": false,
      "10": false,
    },
  ),
  QuestionModel("What number comes next? 5, 10, 15, ?", {
    "20": true,
    "22": false,
    "25": false,
    "30": false,
  }),
  QuestionModel("Continue the pattern: 3, 6, 9, 12, ?", {
    "15": true,
    "16": false,
    "18": false,
    "20": false,
  }),
  QuestionModel("What number follows in the sequence? 10, 20, 30, 40, ?", {
    "45": false,
    "50": true,
    "55": false,
    "60": false,
  }),
  QuestionModel("Complete the series: 4, 8, 12, 16, ?", {
    "18": false,
    "20": false,
    "22": false,
    "24": true,
  }),
  QuestionModel("What number comes next? 6, 12, 18, 24, ?", {
    "28": true,
    "30": false,
    "32": false,
    "36": false,
  }),
  QuestionModel("Continue the pattern: 1, 4, 9, 16, ?", {
    "20": false,
    "23": false,
    "25": true,
    "30": false,
  }),
  QuestionModel("What number follows in the sequence? 12, 24, 36, 48, ?", {
    "52": false,
    "56": false,
    "60": false,
    "72": true,
  }),
  QuestionModel("Complete the series: 7, 14, 21, 28, ?", {
    "32": false,
    "35": false,
    "36": false,
    "42": true,
  }),
  QuestionModel("What number comes next? 9, 18, 27, 36, ?", {
    "40": false,
    "45": true,
    "50": false,
    "54": false,
  }),
];
