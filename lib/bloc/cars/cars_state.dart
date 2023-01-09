import 'package:working_with_bloc_cubit/data/models/car_full_info.dart';

import '../../data/models/car_model.dart';

abstract class CarsState{}


class InitialState extends CarsState{}


class LoadCarsInProgress extends CarsState {}

//cars stated

class LoadCarsInSuccess extends CarsState {
  LoadCarsInSuccess({required this.cars});

  final Car cars;
}

class LoadCarsInFailure extends CarsState {
  LoadCarsInFailure({required this.errorText});

  final String errorText;
}

//single car state

class LoadSingleCarInSuccess extends CarsState{
LoadSingleCarInSuccess(this.car);

  final CarFullInfo car;
}

class LoadSingleCarInFailury extends CarsState{
  LoadSingleCarInFailury(this.error);

  final String error;

}


