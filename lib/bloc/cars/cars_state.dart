import '../../data/models/car_model.dart';

abstract class CarsState{}

class InitialState extends CarsState{}

class LoadCarsInProgress extends CarsState {}

class LoadCarsInSuccess extends CarsState {
  LoadCarsInSuccess({required this.cars});

  final Car cars;
}

class LoadCarsInFailure extends CarsState {
  LoadCarsInFailure({required this.errorText});

  final String errorText;
}
