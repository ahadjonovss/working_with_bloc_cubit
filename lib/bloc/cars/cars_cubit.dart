import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc_cubit/bloc/cars/cars_state.dart';
import 'package:working_with_bloc_cubit/data/repositories/cars_repository.dart';
import 'package:working_with_bloc_cubit/utils/get_it.dart';

import '../../data/models/my_reponse.dart';

class CarsCubit extends  Cubit<CarsState>{
  CarsCubit():super(InitialState());

  fetchCars() async {
    emit(LoadCarsInProgress());
    MyResponse myResponse = await myLocator<CarsRepository>().getAllCars();
    if(myResponse.error.isEmpty){
      emit(LoadCarsInSuccess(cars: myResponse.data));
    }else{
      emit(LoadCarsInFailure(errorText: myResponse.error));
    }
  }

}