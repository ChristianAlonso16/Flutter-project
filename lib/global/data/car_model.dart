class CarModel {
  final int? idCar;
  final String brand;
  final String model;
  final String cilindrada;
  final String color;

  CarModel({
    this.idCar,
    required this.brand,
    required this.model,
    required this.cilindrada,
    required this.color,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      idCar: json['idCar'],
      brand: json['brand'],
      model: json['model'],
      cilindrada: json['cilindrada'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idCar': idCar,
      'brand': brand,
      'model': model,
      'cilindrada': cilindrada,
      'color': color,
    };
  }
}
