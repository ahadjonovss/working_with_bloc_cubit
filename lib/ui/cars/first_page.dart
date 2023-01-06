import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc_cubit/bloc/cars/cars_cubit.dart';
import 'package:working_with_bloc_cubit/bloc/cars/cars_state.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CarsCubit,CarsState>(
          builder:(context, state) {
            if(state is InitialState){
              return Center(
                child: Text("No data"),
              );
            }
            if(state is LoadCarsInProgress){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is LoadCarsInFailure){
              return Text(state.errorText,);
            }
            if(state is LoadCarsInSuccess){
              return ListView(
                children: List.generate(
                  state.cars.data.length,
                      (index) => ListTile(
                    title: Text(
                      state.cars.data[index].carModel,
                    ),
                  ),
                ),
              );
            }
            return Container();

          }, ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CarsCubit>().fetchCars();
        },
      ),
    );
  }
}
