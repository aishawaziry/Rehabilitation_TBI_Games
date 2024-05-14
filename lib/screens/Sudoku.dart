// import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rehab_hub/widgets/blokChar.dart';
import 'package:rehab_hub/widgets/boxInner.dart';
import 'package:rehab_hub/widgets/focusClass.dart';
import 'package:quiver/iterables.dart';
import 'package:sudoku_solver_generator/sudoku_solver_generator.dart';

class Suduko extends StatefulWidget {
  const Suduko({super.key});

  @override
  State<Suduko> createState() => _SudukoState();
}

class _SudukoState extends State<Suduko> {
  // MediaQuery mediaQuery = MediaQuery(data: data, child: child)
  List<BoxInner> boxInners = [];
  FocusClass focusClass =FocusClass();
  bool isFinished = false ;
  String? tapBoxIndex;

  @override
  void initState() {
    generateSuduko();

    super.initState();
  }

  generateSuduko(){
    isFinished = false;
    focusClass = new FocusClass();
    tapBoxIndex = null;
    generatePuzzle();
    checkFinish();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    // TextStyle textStyle = TextStyle(color: Colors.white);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // leading: ,
        actions: [
          IconButton(onPressed: () => generatePuzzle() , icon: Icon(Icons.refresh))
        ],
        title: Text(
            'Suduko',
            // style: TextStyle(color: Colors.black)
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepPurple,Colors.deepPurpleAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              )
          ),
          padding: EdgeInsetsDirectional.all(16),
          // height: 700,
          width: double.maxFinite,
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                padding: EdgeInsetsDirectional.all(2),
                margin: EdgeInsets.all(8),
                // height: 400,
                color: Colors.white,
                width: double.maxFinite,
                child: GridView.builder(
                    itemCount: boxInners.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    physics: ScrollPhysics(),
                    itemBuilder: (buildContext,index){
                      BoxInner boxInner = boxInners[index];
                      return Container(
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: GridView.builder(
                            itemCount: boxInner.blokChars.length,
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 1,
                              crossAxisSpacing: 1,
                              mainAxisSpacing: 1,
                            ),
                            physics: ScrollPhysics(),
                            itemBuilder: (buildContext,indexChar){
                              BlokChar blokChar = boxInner.blokChars[indexChar];
                              Color color = Colors.yellow.shade100;
                              Color colorText = Colors.deepPurple;

                              if(isFinished) color = Colors.green;
                              else if(blokChar.isDefault) color = Colors.grey;
                              else if(blokChar.isFocus) color = Colors.brown.shade100;

                              if(tapBoxIndex == "${index} - ${indexChar}" && !isFinished)
                                color = Colors.blue.shade100;

                              if(this.isFinished)
                                colorText = Colors.white;
                              else if (blokChar.isExist) colorText = Colors.red;

                              return Container(
                                // margin: EdgeInsets.all(5),
                                color: color,
                                alignment: Alignment.center,
                                child: TextButton(
                                  onPressed: blokChar.isDefault
                                  ? null
                                  : () => setFocus(index, indexChar),
                                  child: Text(
                                    '${blokChar.text}',
                                    style: TextStyle(color: colorText),
                                  ),
                                  )
                              );
                            }
                        ),
                      );
                    }
                    ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: Container(
                  // height: 100,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child:
                  Row(
                    children: [
                      GridView.builder(
                          itemCount: 9,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                          ),
                          physics: ScrollPhysics(),
                          itemBuilder: (buildContext,index){
                            return TextButton(
                              onPressed: () => setInput(index+1),
                              // margin: EdgeInsets.all(5),
                              // color: Colors.yellow,
                              // alignment: Alignment.center,
                              child: Text('${index+1}'),
                            );
                          }
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: TextButton(
                            onPressed: () => setInput(null),
                            child: Text('Clear'),
                            ),
                          )
                      ),
                    ],
                  ),
                ),
              ),
              // Expanded(
              //   child: Container(
              //     // height: 100,
              //     decoration: BoxDecoration(
              //       color: Colors.yellow,
              //     ),
              //     child: Row(
              //       children: [
              //         GridView.builder(
              //             itemCount: 9,
              //             shrinkWrap: true,
              //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //               crossAxisCount: 3,
              //               childAspectRatio: 1,
              //               crossAxisSpacing: 2,
              //               mainAxisSpacing: 2,
              //             ),
              //             physics: ScrollPhysics(),
              //             itemBuilder: (buildContext,index){
              //               return Container(
              //                 margin: EdgeInsets.all(5),
              //                 color: Colors.yellow,
              //                 alignment: Alignment.center,
              //                 child: Text('${index+1}'),
              //               );
              //             }
              //         ),
              //         Expanded(
              //             child: Container(
              //               child: InkWell(
              //                 child: Text('clear'),
              //               ),
              //             )
              //         )
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
  generatePuzzle(){
    //
     boxInners.clear();
    var sudokuGenerator = SudokuGenerator(emptySquares: 20); //54
    // then we populate to get a possible cmbination
    // Quiver for easy populate collection using partition
    List<List<List<int>>> completes = partition(sudokuGenerator.newSudokuSolved,
            sqrt(sudokuGenerator.newSudoku.length).toInt())
        .toList();
        partition(sudokuGenerator.newSudoku,sqrt(sudokuGenerator.newSudoku.length).toInt())
        .toList()
        .asMap()
        .entries
        .forEach(
      (entry) {
        List<int> tempListCompletes =
            completes[entry.key].expand((element) => element).toList();
        List<int> tempList = entry.value.expand((element) => element).toList();

        tempList.asMap().entries.forEach((entryIn) {
          int index =
              entry.key * sqrt(sudokuGenerator.newSudoku.length).toInt() +
                  (entryIn.key % 9).toInt() ~/ 3;

          if (boxInners.where((element) => element.index == index).length ==
              0) {
            boxInners.add(BoxInner(index, []));
          }

          BoxInner boxInner =
              boxInners.where((element) => element.index == index).first;

          boxInner.blokChars.add(BlokChar(
            entryIn.value == 0 ? "" : entryIn.value.toString(),
            index: boxInner.blokChars.length,
            isDefault: entryIn.value != 0,
            isCorrect: entryIn.value != 0,
            correctText: tempListCompletes[entryIn.key].toString(),
          ));
        });
      },
    );
    //
  }

  setFocus(int index, int indexChar) {
    tapBoxIndex = "$index-$indexChar";
    focusClass.setData(index, indexChar);
    showFocusCenterLine();
    setState(() {});
  }

  void showFocusCenterLine() {
    // set focus color for line vertical & horizontal
    int rowNoBox = focusClass.indexBox! ~/ 3;
    int colNoBox = focusClass.indexBox! % 3;

    this.boxInners.forEach((element) => element.clearFocus());

    boxInners.where((element) => element.index ~/ 3 == rowNoBox).forEach(
        (e) => e.setFocus(focusClass.indexChar!, Direction.Horizontal));

    boxInners
        .where((element) => element.index % 3 == colNoBox)
        .forEach((e) => e.setFocus(focusClass.indexChar!, Direction.Vertical));
  }

  setInput(int? number) {
    // set input data based grid
    // or clear out data
    if (focusClass.indexBox == null) return;
    if (boxInners[focusClass.indexBox!].blokChars[focusClass.indexChar!].text ==
            number.toString() ||
        number == null) {
      boxInners.forEach((element) {
        element.clearFocus();
        element.clearExist();
      });
      boxInners[focusClass.indexBox!]
          .blokChars[focusClass.indexChar!]
          .setEmpty();
      tapBoxIndex = null;
      isFinished = false;
      showSameInputOnSameLine();
    } else {
      boxInners[focusClass.indexBox!]
          .blokChars[focusClass.indexChar!]
          .setText("$number");

      showSameInputOnSameLine();

      checkFinish();
    }

    setState(() {});
  }

  void showSameInputOnSameLine() {
    // show duplicate number on same line vertical & horizontal so player know he or she put a wrong value on somewhere

    int rowNoBox = focusClass.indexBox! ~/ 3;
    int colNoBox = focusClass.indexBox! % 3;

    String textInput =
        boxInners[focusClass.indexBox!].blokChars[focusClass.indexChar!].text!;

    boxInners.forEach((element) => element.clearExist());

    boxInners.where((element) => element.index ~/ 3 == rowNoBox).forEach((e) =>
        e.setExistValue(focusClass.indexChar!, focusClass.indexBox!, textInput,
            Direction.Horizontal));

    boxInners.where((element) => element.index % 3 == colNoBox).forEach((e) =>
        e.setExistValue(focusClass.indexChar!, focusClass.indexBox!, textInput,
            Direction.Vertical));

    List<BlokChar> exists = boxInners
        .map((element) => element.blokChars)
        .expand((element) => element)
        .where((element) => element.isExist)
        .toList();

    if (exists.length == 1) exists[0].isExist = false;
  }



  void checkFinish(){
   int totalUnfinish = boxInners
        .map((e) => e.blokChars)
        .expand((element) => element)
        .where((element) => !element.isCorrect)
        .length;

    isFinished = totalUnfinish == 0;
  }
}
