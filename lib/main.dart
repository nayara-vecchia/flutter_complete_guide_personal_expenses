import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';
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
        accentColor: Color.fromARGB(255, 76, 175, 80),
        errorColor: Colors.redAccent,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              // button: TextStyle(
              //   color: Colors.white,
              // ),
            ),
      ),
      //adaptar para versão pós 2.4.0
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
      date: DateTime.now().subtract(
        Duration(days: 1),
      ),
    ),
    Transaction(
      id: '02',
      title: 'title2',
      amount: 23,
      date: DateTime.now().subtract(
        Duration(days: 2),
      ),
    )
  ];

  List<Transaction> get recentTransaction {
    return _userTransaction.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime selectedDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: selectedDate,
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

  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          myTitle,
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
        ),
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
          Chart(recentTransaction),
          Expanded(
              child: TransactionList(_userTransaction, _deleteTransaction)),
        ],
      ),
    );
  }
}
