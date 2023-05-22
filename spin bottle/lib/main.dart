import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(SpinBottleApp());
}

class SpinBottleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spin the Bottle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SpinBottleScreen(),
    );
  }
}

class SpinBottleScreen extends StatefulWidget {
  @override
  _SpinBottleScreenState createState() => _SpinBottleScreenState();
}

class _SpinBottleScreenState extends State<SpinBottleScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isSpinning = false;
  String _selectedPlayer = '';
  Map<String, int> _spinCountMap = {};

  List<String> _players = [
    'Player 1',
    'Player 2',
    'Player 3',
    'Player 4',
    'Player 5',
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(
      begin: 0,
      end: pi * 2,
    ).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _spinBottle() {
    if (!_isSpinning) {
      setState(() {
        _isSpinning = true;
        _selectedPlayer = '';
      });

      _animationController.forward(from: 0).then((value) {
        setState(() {
          _isSpinning = false;
          _selectedPlayer = _getRandomPlayer();

          _spinCountMap[_selectedPlayer] = (_spinCountMap[_selectedPlayer] ?? 0) + 1;
        });
      });
    }
  }

  String _getRandomPlayer() {
    final random = Random();
    return _players[random.nextInt(_players.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spin the Bottle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: _animation.value,
              child: Image.asset(
                'assets/bottle.png', // Replace with your bottle image path
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 40),
            if (_isSpinning)
              CircularProgressIndicator()
            else
              Column(
                children: [
                  Text(
                    _selectedPlayer.isNotEmpty ? _selectedPlayer : 'Spin the bottle!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Spin Count:',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Column(
                    children: _players.map((player) {
                      final spinCount = _spinCountMap[player] ?? 0;
                      return Text(
                        '$player: $spinCount',
                        style: TextStyle(fontSize: 16),
                      );
                    }).toList(),
                  ),
                ],
              ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _spinBottle,
              child: Text('SPIN'),
            ),
          ],
        ),
      ),
    );
  }
}
