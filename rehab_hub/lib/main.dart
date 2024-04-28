import 'package:flutter/material.dart';
import 'sliding_puzzle.dart'; // Import your game files

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Hub',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/sliding_puzzle': (context) => SlidingPuzzle(), // Add routes for other games
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 16.0),
          Text(
            'Welcome Back!',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: <Widget>[
                buildGameTile(context, 'assets/images/sliding_puzzle_image.png', 'Sliding Puzzle', '/sliding_puzzle'),
                buildGameTile(context, 'assets/images/sliding_puzzle_image.png', 'Game 2', '/game2'),
                buildGameTile(context, 'assets/images/sliding_puzzle_image.png', 'Game 3', '/game3'),
                buildGameTile(context, 'assets/images/sliding_puzzle_image.png', 'Game 4', '/game4'),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Reminders',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          Icon(Icons.alarm, size: 48.0, color: Colors.blue),
          SizedBox(height: 16.0),
          Text(
            'Recommendations',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          Icon(Icons.thumb_up, size: 48.0, color: Colors.blue),
        ],
      ),
    );
  }

  Widget buildGameTile(BuildContext context, String imagePath, String title, String route) {
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
