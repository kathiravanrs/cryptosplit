import 'package:flutter/material.dart';

import '../models/friend.dart';
import '../models/transaction.dart';

class TransactionHistoryScreen extends StatelessWidget {
  final String title;
  final List<Transaction> transactions;
  final List<Friend> friends;

  TransactionHistoryScreen(
      {super.key,
      required this.title,
      required this.transactions,
      required this.friends});

  String getFriendName(String id) {
    return friends.firstWhere((friend) => friend.id == id).name;
  }

  Widget transaction_tile(Transaction transaction, BuildContext ctx) {
    String senderName = getFriendName(transaction.sender);
    String receiverName = getFriendName(transaction.receiver);

    return ListTile(
      title: Text(transaction.description),
      subtitle: Text('$senderName paid $receiverName'),
      trailing: Text('\$${transaction.amount.toStringAsFixed(2)}'),
      onTap: () {
        showDialog(
          context: ctx,
          builder: (context) {
            TextEditingController descriptionController =
                TextEditingController(text: transaction.description);
            TextEditingController amountController =
                TextEditingController(text: transaction.amount.toString());
            return AlertDialog(
              title: const Text('Edit Transaction'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    const Text('Description:'),
                    TextField(
                      controller: descriptionController,
                    ),
                    const SizedBox(height: 10),
                    const Text('Amount:'),
                    TextField(
                      controller: amountController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Save'),
                  onPressed: () {
                    // Add your code here to save the edited transaction
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (BuildContext context, int index) {
          return transaction_tile(transactions[index], context);
        },
      ),
    );
  }
}
