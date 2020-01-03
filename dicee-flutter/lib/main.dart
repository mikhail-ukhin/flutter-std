import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  Random rnd = new Random();

  int maxDice = 5;

  @override
  Widget build(BuildContext context) {

    gyroscopeEvents.listen((GyroscopeEvent event) {
      print(event);
    });

    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  rndDice();
                });
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  rndDice();
                });
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          )
        ],
      ),
    );
  }

  void rndDice() {
    leftDiceNumber = rnd.nextInt(maxDice) + 1;
    rightDiceNumber = rnd.nextInt(maxDice) + 1;
  }
}
