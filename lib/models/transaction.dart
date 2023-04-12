class Transaction {
  final String id;
  final String description;
  final double amount;
  final String sender;
  final String receiver;
  final DateTime date;

  Transaction(
      {required this.id,
      required this.description,
      required this.amount,
      required this.sender,
      required this.receiver,
      required this.date});
}
