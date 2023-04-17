import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(DiceApp());

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dice App'),
        ),
        body: DiceScreen(),
      ),
    );
  }
}

class DiceScreen extends StatefulWidget {
  @override
  _DiceScreenState createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int _numDice = 2;
  List<int> _diceValues = [1, 1];

  void _rollDice() {
    Random random = new Random();
    setState(() {
      for (int i = 0; i < _numDice; i++) {
        _diceValues[i] = random.nextInt(6) + 1;
      }
    });
  }

  void _setNumDice(int num) {
    setState(() {
      _numDice = num.clamp(2, 7); // limit number of dice between 2 and 7
      _diceValues = List.generate(_numDice, (index) => 1);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Text('2 Dice'),
                onPressed: () => _setNumDice(2),
              ),
              ElevatedButton(
                child: Text('3 Dice'),
                onPressed: () => _setNumDice(3),
              ),
              TextButton(
                child: Text('Custom'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Number of Dice'),
                        content: TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            _numDice = int.tryParse(value) ?? 2;
                          },
                        ),
                        actions: [
                          TextButton(
                            child: Text('Ok'),
                            onPressed: () {
                              _setNumDice(_numDice);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              _numDice,
                  (index) => Image.asset(
                'assets/images/dice${_diceValues[index]}.png',
                height: 150.0,
                width: 150.0,
              ),
            ),
          ),
          SizedBox(height: 30.0),
          ElevatedButton(
            child: Text('Roll Dice'),
            onPressed: _rollDice,
          ),
        ],
      ),
    );
  }
}
