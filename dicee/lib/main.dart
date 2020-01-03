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
  bool shaking = false;

  int maxDice = 5;

  @override
  Widget build(BuildContext context) {

    gyroscopeEvents.listen((GyroscopeEvent event) {

      var x = event.x.abs();
      var y = event.y.abs();
      var z = event.z.abs();

      final delta = 0.5;

      if (x < delta && y < delta && z < delta) {

        if (shaking) {
          setState(() {
            rndDice();
          });
          shaking = false;
        }
      }
      else {
        shaking = true;
      }
    });

    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
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
