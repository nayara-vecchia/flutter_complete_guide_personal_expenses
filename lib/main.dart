import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final myTitle = 'Personal Expenses App';
  static const myHomePage = MyHomePage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: myTitle,
      home: myHomePage,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  final myText = 'Text';
  final myBody = 'Body';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(myText),
      ),
      body: Center(
        child: Text(myBody),
      ),
    );
  }
}