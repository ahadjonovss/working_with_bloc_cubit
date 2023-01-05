import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc_cubit/bloc/area_calc_cubit/areaCubit.dart';
import 'package:working_with_bloc_cubit/ui/first_task.dart';

void main() {
  runApp( MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => AreaCalcCubit(),)
    ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstTask(),
    );
  }
}
