import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transactions.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final myTitle = 'Personal Expenses App';
  static final myHomePage = MyHomePage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: myTitle,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.lightBlueAccent,
      ),
      home: myHomePage,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myTitle = 'Personal Expenses';
  final myChart = 'Chart';

  final List<Transaction> _userTransaction = [
    Transaction(
      id: '01',
      title: 'title1',
      amount: 72,
      date: DateTime.now(),
    ),
    Transaction(
      id: '02',
      title: 'title2',
      amount: 23,
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(_addNewTransaction),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(myTitle),
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(Icons.add),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(
          Icons.add,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: Card(
              color: Theme.of(context).primaryColorLight,
              elevation: 5,
              child: Text(myChart), //Container substituido por SizedBox
            ),
          ),
          TransactionList(_userTransaction),
        ],
      ),
    );
  }
}
