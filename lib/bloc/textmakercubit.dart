import 'package:flutter_bloc/flutter_bloc.dart';

class TextMakerCubit extends Cubit<String>{
  TextMakerCubit(String newWord):super(newWord);


  TextMakerCubit.newCons(String newWord):super(newWord);

  void stateToUpperCase(String newword){
    emit(newword.toUpperCase());
  }

}