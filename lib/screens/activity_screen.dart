import 'package:flutter/material.dart';
import '../models/transaction.dart';

class ActivityScreen extends StatelessWidget {
  final List<Transaction> transactions;

  const ActivityScreen({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (BuildContext context, int index) {
        Transaction transaction = transactions[index];
        return ListTile(
          title: Text(transaction.description),
          subtitle: Text(
              '${transaction.sender} paid ${transaction.receiver} ${transaction.amount}'),
        );
      },
    );
  }
}
