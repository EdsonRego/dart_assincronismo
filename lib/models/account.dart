class Account {
  final String id;
  final String name;
  final String lastName;
  final double balance;

  const Account({
    required this.id,
    required this.name,
    required this.lastName,
    required this.balance,
  });

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'] as String,
      name: map['name'] as String,
      lastName: map['lastName'] as String,
      balance: (map['balance'] as num).toDouble(), // ✅ aceita int ou double
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'lastName': lastName,
        'balance': balance,
      };

  @override
  String toString() => 'Conta $id | $name $lastName | Saldo: $balance';
}
