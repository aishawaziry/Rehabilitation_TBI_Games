import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

List<String> fill_source1() {
  return [
    'assets/animal/dino.png',
    'assets/animal/elephant.png',
    'assets/animal/fish.png',
    'assets/animal/frog.png',
    'assets/animal/girraf.png',
    'assets/animal/octo.png',
    'assets/animal/peacock.png',
    'assets/animal/rabbit.png',
    'assets/animal/seahorse.png',
    'assets/animal/shark.png',
    'assets/animal/whale.png',
    'assets/animal/wolf.png',
  ];
}

List<String> fill_source2() {
  return [
    'assets/shapes/OCTAGON.png',
    'assets/shapes/circle.png',
    'assets/shapes/heart.png',
    'assets/shapes/hexagons.png',
    'assets/shapes/oval.png',
    'assets/shapes/parallelogram.png',
    'assets/shapes/pentagon.png',
    'assets/shapes/plus.png',
    'assets/shapes/r_triangle.png',
    'assets/shapes/rectangle.png',
    'assets/shapes/rhombus.png',
    'assets/shapes/square.png',
    'assets/shapes/star.png',
    'assets/shapes/trapezoid.png',
    'assets/shapes/triangle.png'
  ];
}

enum Level { hard, medium, easy }
List<String> getSourceArray(Level level) {
  List<String> levelList = [];
  List<String> sourceArray = fill_source1();
  List<String> sourceArray1 = fill_source2();

  if (level == Level.hard) {
    levelList.addAll(sourceArray1);
    levelList.addAll(sourceArray1);
  } else if (level == Level.medium) {
    levelList.addAll(sourceArray);
    levelList.addAll(sourceArray);
  } else if (level == Level.easy) {
    List<String> randomImages = [];
    while (randomImages.length < 6) {
      String randomImage = sourceArray[Random().nextInt(sourceArray.length)];
      if (!randomImages.contains(randomImage)) {
        randomImages.add(randomImage);
      }
    }
    levelList.addAll(randomImages);
    levelList.addAll(randomImages);
  }

  levelList.shuffle();
  return levelList;
}

List<bool> getInitialItemState(Level level) {
  List<bool> initialItemState = [];

  List<String> levelList = getSourceArray(level);
  int length = levelList.length;

  for (int i = 0; i < length; i++) {
    initialItemState.add(true);
  }

  return initialItemState;
}
List<GlobalKey<FlipCardState>> getCardStateKeys(Level level) {
  List<GlobalKey<FlipCardState>> cardStateKeys = [];

  List<String> levelList = getSourceArray(level);
  int length = levelList.length;

  for (int i = 0; i < length; i++) {
    cardStateKeys.add(GlobalKey<FlipCardState>());
  }

  return cardStateKeys;
}