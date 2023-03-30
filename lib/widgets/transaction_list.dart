import 'package:flutter/material.dart';

import 'package:personal_expenses_app/models/transactions.dart';

import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransactions;

  const TransactionList(this.transactions, this.deleteTransactions);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No transaction added yet',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.1,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return TransactionItem(
                  transaction: transactions[index],
                  deleteTransactions: deleteTransactions);
            },
          );
  }
}
