import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widgets/edit_transaction_dialog.dart';

class TransactionHistoryScreen extends StatelessWidget {
  final String title;
  final List<Transaction> transactions;

  const TransactionHistoryScreen(
      {super.key, required this.title, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$title Transaction History')),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (BuildContext context, int index) {
          Transaction transaction = transactions[index];
          return ListTile(
            title: Text(transaction.description),
            subtitle: Text(
                '${transaction.sender} paid ${transaction.receiver} ${transaction.amount}'),
            onTap: () async {
              await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return EditTransactionDialog(transaction: transaction);
                },
              );
              // Reload data if needed (using state management solution)
            },
          );
        },
      ),
    );
  }
}
