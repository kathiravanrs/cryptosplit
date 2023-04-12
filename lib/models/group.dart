import 'package:cryptosplit/models/transaction.dart';

import 'friend.dart';

class Group {
  final String id;
  final String name;
  final List<String> memberIds;
  final List<Friend> members;
  final List<Transaction> transactions;

  Group(
      {required this.id,
      required this.name,
      required this.memberIds,
      required this.members,
      required this.transactions});
}
