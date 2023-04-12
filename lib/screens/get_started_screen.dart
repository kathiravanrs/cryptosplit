import 'package:cryptosplit/screens/settings_screen.dart';
import 'package:flutter/material.dart';

import '../models/friend.dart';
import '../models/group.dart';
import '../models/transaction.dart';
import 'activity_screen.dart';
import 'friends_screen.dart';
import 'groups_screen.dart';
import 'overview_screen.dart';

class GetStartedScreen extends StatelessWidget {
  final List<Friend> friends;
  final List<Group> groups;
  final List<Transaction> transactions;

  const GetStartedScreen(
      {super.key,
      required this.friends,
      required this.groups,
      required this.transactions});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CryptoSplit'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.dashboard), text: 'Overview'),
              Tab(icon: Icon(Icons.group), text: 'Groups'),
              Tab(icon: Icon(Icons.person), text: 'Friends'),
              Tab(icon: Icon(Icons.list), text: 'Activity'),
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OverviewScreen(friends: friends, groups: groups),
            GroupsScreen(groups: groups),
            FriendsScreen(friends: friends),
            ActivityScreen(transactions: transactions),
            const SettingsScreen(),
          ],
        ),
      ),
    );
  }
}
