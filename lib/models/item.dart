class Item {
  String name;
  double price;
  int quantity;

  Item({
    required this.name,
    required this.price,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'] as String,
      price: json['price'] as double,
      quantity: json['quantity'] as int,
    );
  }
}
