import 'package:flutter/material.dart';

import './widgets/user_transactions.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final myTitle = 'Personal Expenses App';
  static final myHomePage = MyHomePage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: myTitle,
      home: myHomePage,
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final myTitle = 'Title';
  final myChart = 'Chart';
  final myBody = 'List';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(myTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              elevation: 5,
              child: Text(myChart), //Container substituido por SizedBox
            ),
          ),
          UserTransactions(),
        ],
      ),
    );
  }
}
