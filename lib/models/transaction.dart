class Transaction {
  int id;
  int? billId;
  String description;
  double amount;
  DateTime creationDate;
  DateTime? completionDate;
  bool isPending;

  Transaction({
    required this.id,
    this.billId,
    required this.description,
    required this.amount,
    required this.creationDate,
    this.completionDate,
    required this.isPending,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'billId': billId,
      'description': description,
      'total': amount,
      'creationDate': creationDate.toIso8601String(),
      'completionDate': completionDate?.toIso8601String(),
      'isPending': isPending,
    };
  }

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] as int,
      billId: json['billId'] as int?,
      description: json['description'] as String,
      amount: json['total'] as double,
      creationDate: DateTime.parse(json['creationDate'] as String),
      completionDate: json['completionDate'] == null
          ? null
          : DateTime.parse(json['completionDate'] as String),
      isPending: json['isPending'] as bool,
    );
  }
}
