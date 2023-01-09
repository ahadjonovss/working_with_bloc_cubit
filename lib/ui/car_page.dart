import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc_cubit/bloc/cars/cars_bloc.dart';
import 'package:working_with_bloc_cubit/bloc/cars/cars_event.dart';
import 'package:working_with_bloc_cubit/bloc/cars/cars_state.dart';
import 'package:working_with_bloc_cubit/data/repositories/cars_repository.dart';
import 'package:working_with_bloc_cubit/ui/widgets/car_detailes.dart';

class CarPage extends StatelessWidget {
  int id;
   CarPage({required this.id,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarsBloc(CarsRepository()),
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: BlocBuilder<CarsBloc,CarsState>(
                builder: (context, state) {
                  if(state is LoadSingleCarInSuccess){
                    return CarDetails(car: state.car,);
                  }
                  if(state is LoadCarsInProgress){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if(state is LoadSingleCarInFailury){
                    return Center(child: Text(state.error),);
                  }
                  return Center(
                    child: IconButton(onPressed: (){
                      context.read<CarsBloc>().add(FetchSingleCarEvent(id));
                    }, icon: Icon(Icons.download)),
                  );

                },),
          ),
        ));
  }
}
