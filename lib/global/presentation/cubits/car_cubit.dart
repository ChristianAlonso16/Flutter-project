import 'package:bloc/bloc.dart';
import 'package:firstapp/global/data/car_model.dart';
import 'package:firstapp/global/data/repository/car_repository.dart';
import 'package:firstapp/global/presentation/cubits/car_state.dart';


class CarCubit extends Cubit<CarState> {
  final CarRepository carRepository;

  CarCubit({required this.carRepository}) : super(CarInitial());


  Future<void> createCar(CarModel car) async {
    try {
      emit(CarLoading());
      await carRepository.createCars(car);
      final cars = await carRepository.getAllCars();
      emit(CarSuccess(cars: cars));
    } catch (e) {
      emit(CarError(message: e.toString()));
    }
  }

  Future<void> getCar(String id) async {
    try {
      emit(CarLoading());
      final car = await carRepository.getCar(id);
      emit(CarSuccess(cars: [car]));
    } catch (e) {
      emit(CarError(message: e.toString()));
    }
  }

  Future<void> updateCar(String id,CarModel car) async {
    try {
      emit(CarLoading());
      await carRepository.updateCar(id,car);
      final cars = await carRepository.getAllCars();
      emit(CarSuccess(cars: cars));
    } catch (e) {
      emit(CarError(message: e.toString()));
    }
  }

  Future<void> deleteCar(String id) async {
    try {
      emit(CarLoading());
      await carRepository.deleteCar(id);
      final cars = await carRepository.getAllCars();
      emit(CarSuccess(cars:cars));
    } catch (e) {
      emit(CarError(message: e.toString()));
    }
  }

  Future<void> fetchAllCars() async {
    try {
      emit(CarLoading());
      final cars = await carRepository.getAllCars();
      emit(CarSuccess(cars: cars));
    } catch (e) {
      emit(CarError(message: e.toString()));
    }
  }
}
