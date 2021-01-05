import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiceGame extends StatefulWidget {
  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  bool isStart = false;
  bool rollDice = false;
  bool show = false;
  var dices = [
    'assets/images/d1.png',
    'assets/images/d2.png',
    'assets/images/d3.png',
    'assets/images/d4.png',
    'assets/images/d5.png',
    'assets/images/d6.png'
  ];
  var index1 = 0;
  var index2 = 0;
  var highestScore = 0;
  var score = 0;
  var random = Random.secure();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Game Demo'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(show)if (highestScore > 0) Text('Highest Score: $highestScore', style: TextStyle(fontSize: 30), textAlign: TextAlign.center),
            if (rollDice)
              Text('Score: $score',
                  style: TextStyle(fontSize: 30), textAlign: TextAlign.center),
            SizedBox(height: 80),
            if(rollDice)Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(dices[index1], width: 150, height: 150),
                Image.asset(dices[index2], width: 150, height: 150)
              ],
            ),
            if (!isStart)
              RaisedButton(
                onPressed: () {
                  setState(() {
                    isStart = true;
                  });
                },
                color: Colors.orange,
                child: Text('Start'),
                textColor: Colors.white,
              ),
            if (isStart)
              RaisedButton(
                onPressed: () {
                  setState(() {
                    rollDice = true;
                    show = false;
                    index1 = random.nextInt(6);
                    index2 = random.nextInt(6);
                    score += index1 + index2 + 2;
                    var count = index1 + index2 + 2;
                    if (count == 7) {
                      highestScore = score;
                      rollDice = false;
                      score = 0;
                      count = 0;
                      show = true;
                    }
                  });
                },
                color: Colors.deepOrange,
                child: Text('Roll the Dice'),
                textColor: Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}
