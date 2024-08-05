class CarModel {
  final int? idAuto;
  final String model;
  final String brand;
  final int year;
  final double price;
  final String type;
  final String fuel;
  final int doors;
  final String engine;
  final double height;
  final double width;
  final double length;
  final String description;
  final int status;
  final List<String> images;

  CarModel({
    this.idAuto,
    required this.model,
    required this.brand,
    required this.year,
    required this.price,
    required this.type,
    required this.fuel,
    required this.doors,
    required this.engine,
    required this.height,
    required this.width,
    required this.length,
    required this.description,
    required this.status,
    required this.images,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      idAuto: json['id_auto'],
      model: json['model'],
      brand: json['brand'],
      year: json['year'],
      price: json['price'],
      type: json['type'],
      fuel: json['fuel'],
      doors: json['doors'],
      engine: json['engine'],
      height: json['height'],
      width: json['width'],
      length: json['length'],
      description: json['description'],
      status: json['status'],
      images: List<String>.from(json['images']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_auto': idAuto,
      'model': model,
      'brand': brand,
      'year': year,
      'price': price,
      'type': type,
      'fuel': fuel,
      'doors': doors,
      'engine': engine,
      'height': height,
      'width': width,
      'length': length,
      'description': description,
      'status': status,
      'images': images,
    };
  }
}
