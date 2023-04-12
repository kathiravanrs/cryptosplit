import 'package:cryptosplit/data.dart';
import 'package:cryptosplit/screens/transaction_history_screen.dart';
import 'package:flutter/material.dart';

import '../models/friend.dart';

class FriendsScreen extends StatefulWidget {
  final List<Friend> friends;

  const FriendsScreen({super.key, required this.friends});

  @override
  _FriendsScreenState createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.friends.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return const ListTile(title: Text('Outstanding Balances:'));
          } else {
            Friend friend = widget.friends[index - 1];
            return ListTile(
              title: Text(friend.name),
              subtitle: Text('Balance: ${friend.balance}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransactionHistoryScreen(
                      title: friend.name,
                      transactions: friend.transactions,
                      friends: friends,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add expense with a friend
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
