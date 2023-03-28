import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './adaptive_button.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate = null;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addNewTransaction(
      //widget. acessa as propriedades e métodos da classe dentro da state Class
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
      print(_selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Label'),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              SizedBox(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        // ignore: unnecessary_null_comparison
                        _selectedDate == null
                            ? 'No date chosen'
                            : 'Picked date ${DateFormat.yMd().format(_selectedDate!) as String}',
                      ),
                    ),
                    AdaptiveTextButton('Chose date', _presentDatePicker)
                    // TextButton(
                    //   onPressed: _presentDatePicker,
                    //   style: ButtonStyle(
                    //     foregroundColor: MaterialStateProperty.all(
                    //         Theme.of(context).primaryColor),
                    //   ),
                    //   child: Text(
                    //     'Chose date',
                    //     style: TextStyle(fontWeight: FontWeight.bold),
                    //   ),
                    // )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: _submitData,
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                    Colors.white,
                  ),
                ),
                child: Text('Add Transaction'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
