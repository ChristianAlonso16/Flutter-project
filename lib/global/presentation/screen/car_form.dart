import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firstapp/global/presentation/cubits/car_cubit.dart';
import 'package:firstapp/global/data/car_model.dart';

class CarForm extends StatelessWidget {
  final CarModel? car;
  const CarForm({Key? key, this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final brandController = TextEditingController(text: car?.brand);
    final modelController = TextEditingController(text: car?.model);
    final cilindradaController = TextEditingController(text: car?.cilindrada);
    final colorController = TextEditingController(text: car?.color);

    return Scaffold(
      appBar: AppBar(
        title: Text(car == null ? 'Add Car' : 'Edit Car'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: brandController,
                decoration: const InputDecoration(labelText: 'Brand'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the brand';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: modelController,
                decoration: const InputDecoration(labelText: 'Model'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the model';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: cilindradaController,
                decoration: const InputDecoration(labelText: 'Cilindrada'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the cilindrada';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: colorController,
                decoration: const InputDecoration(labelText: 'Color'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the color';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final carCubit = BlocProvider.of<CarCubit>(context);
                    final carModel = CarModel(
                      idCar: car?.idCar,
                      brand: brandController.text,
                      model: modelController.text,
                      cilindrada: cilindradaController.text,
                      color: colorController.text,
                    );
                    if (car == null) {
                      carCubit.createCar(carModel);
                    } else {
                      carCubit.updateCar(car?.idCar as String, carModel);
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(car == null ? 'Add' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
