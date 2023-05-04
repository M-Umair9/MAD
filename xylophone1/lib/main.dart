import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Xylophone'),
        ),
        body: Xylo(),
      ),
    );
  }
}

class Xylo extends StatefulWidget {
  const Xylo({Key? key}) : super(key: key);

  @override
  State<Xylo> createState() => _XyloState();
}

class _XyloState extends State<Xylo> {
  void PlaySound(int num) {
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/assets_note$num.wav"),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.grey,
          child: TextButton(
              onPressed: () {
                PlaySound(1);
              },
              child: Text("Button 1")),
        ),
        Container(
          color: Colors.blueGrey,
          child: TextButton(
              onPressed: () {
                PlaySound(2);
              },
              child: Text("Button 1")),
        ),
        Container(
          color: Colors.black54,
          child: TextButton(
              onPressed: () {
                PlaySound(3);
              },
              child: Text("Button 1")),
        )
      ],
    );
  }
}