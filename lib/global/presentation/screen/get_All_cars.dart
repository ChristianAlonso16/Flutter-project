import 'package:firstapp/global/data/repository/car_repository.dart';
import 'package:firstapp/global/presentation/cubits/car_cubit.dart';
import 'package:firstapp/global/presentation/cubits/car_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firstapp/global/presentation/screen/car_form.dart';
class CarListView extends StatelessWidget {
  const CarListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car List'),
      ),
      body: BlocProvider(
        create: (context) => CarCubit(
          carRepository: RepositoryProvider.of<CarRepository>(context),
        )..fetchAllCars(), // Cargar automáticamente los autos
        child: const CarListScreen(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CarForm()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carCubit = BlocProvider.of<CarCubit>(context);

    return BlocBuilder<CarCubit, CarState>(
      builder: (context, state) {
        if (state is CarLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CarSuccess) {
          final cars = state.cars;
          return ListView.builder(
            itemCount: cars.length,
            itemBuilder: (context, index) {
              final car = cars[index];
              return ListTile(
                title: Text(car.model),
                subtitle: Text(car.brand),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CarForm(car: car),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        carCubit.deleteCar(car.idCar.toString());
                      },
                    ),
                  ],
                ),
              );
            },
          );
        } else if (state is CarError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return const Center(child: Text('No cars available'));
      },
    );
  }
}
