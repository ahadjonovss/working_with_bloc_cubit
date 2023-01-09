import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc_cubit/bloc/cars/cars_event.dart';
import 'package:working_with_bloc_cubit/bloc/cars/cars_state.dart';
import 'package:working_with_bloc_cubit/data/models/my_reponse.dart';
import 'package:working_with_bloc_cubit/data/repositories/cars_repository.dart';

class CarsBloc extends Bloc<CarsEvent,CarsState>{

  CarsBloc(this.carsRepository):super(InitialState()){
    on<FetchAllCarsEvent> (_fetchAllCars);
    on<FetchSingleCarEvent> (_fetchSingleCar);
  }

  final CarsRepository carsRepository;

  _fetchAllCars(FetchAllCarsEvent event,Emitter emit) async{
    emit(LoadCarsInProgress());
    MyResponse myResponse = await carsRepository.getAllCars();
    if (myResponse.error.isEmpty) {
      //success
      emit(LoadCarsInSuccess(cars: myResponse.data));
    } else {
      //error
      emit(LoadCarsInFailure(errorText: myResponse.error));
    }
  }

  _fetchSingleCar(FetchSingleCarEvent event, Emitter<CarsState> emit) async {
    //loading
    emit(LoadCarsInProgress());
    MyResponse myResponse = await carsRepository.getSingleCar(event.id);
    if (myResponse.error.isEmpty) {
      //success
      emit(LoadSingleCarInSuccess(myResponse.data));
    } else {
      //error
      emit(LoadSingleCarInFailury(myResponse.error));
    }
  }
}