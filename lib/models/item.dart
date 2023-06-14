class Item {
  int id;
  String name;
  double price;
  int quantity;

  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as double,
      quantity: json['quantity'] as int,
    );
  }
}
