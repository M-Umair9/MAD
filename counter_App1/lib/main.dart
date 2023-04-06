import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Counter',
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _counter = 0;
  int _incrementValue = 1;
  int _decrementValue = 1;

  void _incrementCounter() {
    setState(() {
      _counter += _incrementValue;
      _controller.forward(from: 0);
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter -= _decrementValue;
      _controller.forward(from: 0);
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Counter'),
      ),
      body: Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      ScaleTransition(
      scale: _animation,
      child: const Text(
        'Counter:',
        style: TextStyle(fontSize: 24.0),
      ),
    ),
    SizedBox(
    height: 16,
    ),
    ScaleTransition(
    scale: _animation,
    child: Text(
    '$_counter',
    style: Theme.of(context).textTheme.headline3,
    ),
    ),
    const SizedBox(height: 16),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    CounterButton(
    onPressed: _decrementCounter,
    tooltip: 'Decrement',
    child: const Icon(Icons.remove),
    ),
    const SizedBox(width: 16),
    CounterButton(
    onPressed: _incrementCounter,
    tooltip: 'Increment',
    child: const Icon(Icons.add),
    ),
    ],
    ),
    const SizedBox(height: 16),
    const Text(
    'Increment by:',
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    SizedBox(
    width: 100,
    child: TextField(
    textAlign: TextAlign.center,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(hintText: '$_incrementValue'),
    onChanged: (value) {
    setState(() {
    _incrementValue = int.tryParse(value) ?? 1;
    });
    },
    ),
    ),
    ],
    ),
    const SizedBox(height: 16),
    const Text(
    'Decrement by:',
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    SizedBox(
    width: 100,
    child: TextField(
    textAlign: TextAlign.center,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(hintText: '$_decrementValue'),
      onChanged: (value) {
        setState(() {
          _decrementValue = int.tryParse(value) ?? 1;
        });
      },
    ),
    ),
    ],
    ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _resetCounter,
          child: const Text('Reset Counter'),
        ),
      ],
      ),
      ),
    );
  }
}

class CounterButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final String tooltip;

  const CounterButton({
    Key? key,
    required this.onPressed,
    required this.child,
    required this.tooltip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}


