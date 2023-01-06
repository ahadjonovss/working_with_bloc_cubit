import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc_cubit/bloc/area_calc_cubit/areaCubit.dart';
import 'package:working_with_bloc_cubit/bloc/cars/cars_cubit.dart';
import 'package:working_with_bloc_cubit/ui/cars/first_page.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => AreaCalcCubit(),),
      BlocProvider(create: (context) => CarsCubit(),)
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
      home: const FirstPage(),
    );
  }
}
