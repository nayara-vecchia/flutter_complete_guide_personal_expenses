import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/transactions.dart';

class TransactionList extends StatelessWidget {
  //const TransactionList({Key? key}) : super(key: key);

  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: transactions.map((e) {
        return Card(
          elevation: 5,
          child: Row(
            children: <Widget>[
              Container(
                constraints: const BoxConstraints(minWidth: 90),
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                    width: 2,
                  ),
                ),
                padding: const EdgeInsets.all(10),
                child: Text(
                  'R\$: ${e.amount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    e.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy').format(e.date),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
