import 'package:flutter/material.dart';

import '../models/friend.dart';
import '../models/group.dart';
import '../models/transaction.dart';
import '../utils/sample_data.dart';
import 'get_started_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CryptoSplit', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to CryptoSplit',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'Easily split and settle expenses with friends using cryptocurrencies.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                List<Friend> friends = generateSampleFriends();
                List<Group> groups = generateSampleGroups();
                List<Transaction> transactions = generateSampleTransactions();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GetStartedScreen(
                      friends: friends,
                      groups: groups,
                      transactions: transactions,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
