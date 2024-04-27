import 'package:flutter/material.dart';
import 'package:music_notes_player_app_setup/choose_level.dart';

void main() {
  runApp(const HelloWorldApp());
}

class HelloWorldApp extends StatelessWidget {
  const HelloWorldApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        'choose level': (context) =>  ChooseLevel(),

      },
      initialRoute: 'choose level',
    );
  }
}
