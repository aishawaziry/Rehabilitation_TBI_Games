import 'package:flutter/material.dart';
import 'package:rehab_hub/screens/MatchCards_choose_level.dart';
import 'package:rehab_hub/screens/pattern_main_menu.dart';
import 'package:rehab_hub/screens/recommendation.dart';
import 'package:rehab_hub/widgets/reminder_cards.dart';
import 'screens/sliding_puzzle.dart'; // Import your game files

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Game Hub',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 30, // Adjust the font size as needed
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
            // You can also set other text properties such as color
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/sliding_puzzle': (context) =>
            SlidingPuzzle(), // Add routes for other games
        'reminder': (context) => Reminder(),

        'choose level': (context) => ChooseLevel(),
        '/pattern_recognition': (context) => MainMenu(),
        '/recommendation': (context) => RecommendationPage(),
        // Add routes for other games
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Hub'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 16.0),
            Text(
              'Welcome Back!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      children: <Widget>[
                        buildGameTile(
                            context,
                            'assets/images/sliding_puzzle_image.png',
                            'Sliding Puzzle',
                            '/sliding_puzzle'),
                        buildGameTile(context, 'assets/images/memory.png',
                            'Match Cards', 'choose level'),
                        buildGameTile(context, 'assets/images/pattern_game.jpg',
                            'Pattern Recognition', '/pattern_recognition'),
                        buildGameTile(
                            context,
                            'assets/images/sliding_puzzle_image.png',
                            'Game 4',
                            '/game4'),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Reminders',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 16.0),
                            IconButton(
                              // Convert Icon to IconButton
                              icon: Icon(Icons.alarm,
                                  size: 48.0, color: Colors.blue),
                              onPressed: () {
                                Navigator.pushNamed(context,
                                    'reminder'); // Navigate to the desired page
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Recommendations',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 16.0),
                            IconButton(
                              icon: Icon(Icons.thumb_up,
                                  size: 48.0, color: Colors.blue),
                              onPressed: () {
                                Navigator.pushNamed(context,'/recommendation'); // 
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGameTile(
      BuildContext context, String imagePath, String title, String route) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Card(
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              imagePath,
              width: 120.0,
              height: 120.0,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
