import 'package:cryptosplit/screens/transaction_history_screen.dart';
import 'package:flutter/material.dart';

import '../models/group.dart';

class GroupsScreen extends StatefulWidget {
  final List<Group> groups;

  const GroupsScreen({super.key, required this.groups});

  @override
  _GroupsScreenState createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.groups.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return const ListTile(title: Text('Outstanding Balances:'));
          } else {
            Group group = widget.groups[index - 1];
            return ListTile(
              title: Text(group.name),
              subtitle: Text(
                  'Total Outstanding: ${group.transactions.fold(0.0, (sum, t) => sum + t.amount)}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransactionHistoryScreen(
                      title: group.name,
                      transactions: group.transactions,
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
          // Add expense to a group
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
