import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc_cubit/bloc/area_calc_cubit/area_state.dart';

class AreaCalcCubit extends Cubit<AreaState>{
  AreaCalcCubit():super(InitialState(a: 10, b: 20));

  calcCircleArea(num a,num b){
    emit(CircleState(3.14*a*a));
  }

  calcRectArea(num a,num b){
    emit(RectangleState(a*b));
  }

  calcSquareArea(num a,num b){
    emit(SquareState(a*a));
  }

}