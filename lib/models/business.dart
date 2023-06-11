class Business {
  int id;
  String name;
  double revenue;

  Business({required this.id, required this.name, required this.revenue});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'revenue': revenue,
    };
  }

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      id: json['id'] as int,
      name: json['name'] as String,
      revenue: json['revenue'] as double,
    );
  }
}
