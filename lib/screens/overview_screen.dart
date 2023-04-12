import 'package:flutter/material.dart';

import '../models/friend.dart';

class OverviewScreen extends StatelessWidget {
  final List<Friend> friends;

  OverviewScreen({required this.friends});

  double getTotalOutstandingBalance() {
    double total = 0;
    friends.forEach((friend) {
      total += friend.balance;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    double totalOutstandingBalance = getTotalOutstandingBalance();

    return Scaffold(
      appBar: AppBar(
        title: Text('Overview'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Total Outstanding Balance',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            '\$${totalOutstandingBalance.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'Individual Balances',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: friends.length,
              itemBuilder: (BuildContext context, int index) {
                Friend friend = friends[index];
                return ListTile(
                  title: Text(friend.name),
                  subtitle: Text(friend.balance > 0 ? 'Owes you' : 'You owe'),
                  trailing:
                      Text('\$${friend.balance.abs().toStringAsFixed(2)}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
