import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTransactions,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransactions;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                'R\$: ${transaction.amount.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        subtitle: Text(
          DateFormat('dd/MM/yyyy').format(transaction.date),
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Theme.of(context).primaryColorLight,
          ),
        ),
        trailing: MediaQuery.of(context).size.width > 450
            ? OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.delete, color: Theme.of(context).errorColor),
                label: Text(
                  'Delete',
                  style: TextStyle(color: Theme.of(context).errorColor),
                ),
              )
            : IconButton(
                onPressed: () => deleteTransactions(transaction.id),
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
