import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc_cubit/bloc/cars/cars_cubit.dart';
import 'package:working_with_bloc_cubit/bloc/cars/cars_state.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<CarsCubit,CarsState>(
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

        },
        listener: (context, state) {
          if(state is LoadCarsInSuccess){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${state.cars.data.length} ta malumot keldi")));
          }

        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        context.read<CarsCubit>().fetchCars();
      }),
    );
  }
}
