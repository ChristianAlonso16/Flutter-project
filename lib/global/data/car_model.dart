class CarModel {
  final String? id;
  final String model;
  final String brand;
  final int year;
  final int price;
  final String type;


  CarModel({
    this.id,
    required this.model,
    required this.brand,
    required this.year,
    required this.price,
    required this.type,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      model: json['model'],
      brand: json['brand'],
      year: json['year'],
      price: json['price'],
      type: json['type'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'model': model,
      'brand': brand,
      'year': year,
      'price': price,
      'type': type,
    };
  }
}
