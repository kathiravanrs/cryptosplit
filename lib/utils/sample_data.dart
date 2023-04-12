import 'dart:math';

import '../models/friend.dart';
import '../models/group.dart';
import '../models/transaction.dart';

List<Friend> generateSampleFriends() {
  return [
    Friend(
        id: '1',
        name: 'Alice',
        transactions: generateSampleTransactionsForFriend('1', 3)),
    Friend(
        id: '2',
        name: 'Bob',
        transactions: generateSampleTransactionsForFriend('2', 3)),
    Friend(
        id: '3',
        name: 'Charlie',
        transactions: generateSampleTransactionsForFriend('3', 3)),
  ];
}

List<Group> generateSampleGroups() {
  return [
    Group(
      id: '1',
      name: 'Family',
      memberIds: ['1', '2'],
      members: [],
      transactions: generateSampleTransactionsForGroup('1', ['1', '2'], 3),
    ),
    Group(
      id: '2',
      name: 'Work',
      memberIds: ['1', '3'],
      members: [],
      transactions: generateSampleTransactionsForGroup('2', ['1', '3'], 3),
    ),
  ];
}

List<Transaction> generateSampleTransactions() {
  return [
    Transaction(
        id: '1',
        description: 'Dinner',
        amount: 20,
        sender: '1',
        receiver: '2',
        date: DateTime.now()),
    Transaction(
        id: '2',
        description: 'Movie',
        amount: 15,
        sender: '2',
        receiver: '3',
        date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(
        id: '3',
        description: 'Snacks',
        amount: 5,
        sender: '3',
        receiver: '1',
        date: DateTime.now().subtract(Duration(days: 2))),
  ];
}

Random _random = Random();

double randomAmount() => _random.nextDouble() * 100;

List<Transaction> generateSampleTransactionsForFriend(
    String friendId, int count) {
  return List<Transaction>.generate(count, (index) {
    return Transaction(
      id: '${friendId}_$index',
      description: 'Expense $index',
      amount: randomAmount(),
      sender: _random.nextBool() ? friendId : '0',
      receiver: _random.nextBool() ? friendId : '0',
      date: DateTime.now().subtract(Duration(days: index * 2)),
    );
  });
}

List<Transaction> generateSampleTransactionsForGroup(
    String groupId, List<String> memberIds, int count) {
  return List<Transaction>.generate(count, (index) {
    String sender = memberIds[_random.nextInt(memberIds.length)];
    String receiver = memberIds[_random.nextInt(memberIds.length)];
    return Transaction(
      id: '${groupId}_$index',
      description: 'Expense $index',
      amount: randomAmount(),
      sender: sender,
      receiver: receiver,
      date: DateTime.now().subtract(Duration(days: index * 2)),
    );
  });
}
