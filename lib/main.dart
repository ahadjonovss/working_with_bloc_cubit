import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc_cubit/ui/all_cars_page.dart';

import 'app/app.dart';
import 'app/app_observer.dart';
void main() {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}



