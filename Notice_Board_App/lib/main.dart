import 'package:flutter/material.dart';
import 'package:notice/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Interface',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notice Board'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Perform action for profile icon clicked
              Navigator.push(
                context,
              MaterialPageRoute(
              builder:(context) => LoginApp(),
              ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder:(BuildContext context, int index ) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            child: ListTile(
            title: Text('notification ${index+1}'),
          ),
          );
    },

      ),
    );
  }
}
