import 'package:flutter/material.dart';

import '../models/friend.dart';
import '../models/transaction.dart';

class ActivityScreen extends StatelessWidget {
  final List<Transaction> transactions;
  final List<Friend> friends;

  ActivityScreen({required this.transactions, required this.friends});

  String getFriendName(String id) {
    return friends.firstWhere((friend) => friend.id == id).name;
  }

  Widget transaction_tile(Transaction transaction) {
    String senderName = getFriendName(transaction.sender);
    String receiverName = getFriendName(transaction.receiver);

    return ListTile(
      title: Text(transaction.description),
      subtitle: Text('$senderName paid $receiverName'),
      trailing: Text('\$${transaction.amount.toStringAsFixed(2)}'),
      onTap: () {
        // Add your code here for editing transactions
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity'),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (BuildContext context, int index) {
          return transaction_tile(transactions[index]);
        },
      ),
    );
  }
}
