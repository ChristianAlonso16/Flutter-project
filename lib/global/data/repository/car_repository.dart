import 'dart:convert';
import 'package:http/http.dart' as http;
import '../car_model.dart';

class CarRepository {
  final String apiUrl;
  final String accessToken;

  CarRepository({required this.apiUrl, required this.accessToken});

  Future<void> createCars(CarModel car) async {
    final response = await http.post(
      Uri.parse('$apiUrl/cars/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(car.toJson()..remove('id')),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al crear carro');
    }
  }

  Future<CarModel> getCar(String id) async {
    final response = await http.get(
      Uri.parse('$apiUrl/cars/byId/$id'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      return CarModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al obtener carro con id: $id');
    }
  }

  Future<void> updateCar(String id, CarModel car) async {
    final response = await http.put(
      Uri.parse('$apiUrl/cars/update/$id'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(car.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al actualizar auto');
    }
  }

  Future<void> deleteCar(String id) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/cars/delete/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Error al eliminiar auto');
    }
  }

  Future<List<CarModel>> getAllCars() async {
    final response = await http.get(
      Uri.parse('$apiUrl/get_data'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> carsJson = jsonDecode(response.body);
      return carsJson.map((json) => CarModel.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar los autos');
    }
  }
}
