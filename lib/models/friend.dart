import 'package:cryptosplit/models/transaction.dart';

class Friend {
  final String id;
  final String name;
  final List<Transaction> transactions;
  double balance = 0;

  Friend({required this.id, required this.name, required this.transactions}) {
    balance = calculateBalance();
  }

  double calculateBalance() {
    double total = 0;
    for (Transaction transaction in transactions) {
      if (transaction.sender == id) {
        total -= transaction.amount;
      } else {
        total += transaction.amount;
      }
    }
    return total;
  }
}
