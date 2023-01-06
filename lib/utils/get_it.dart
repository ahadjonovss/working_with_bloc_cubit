import 'package:get_it/get_it.dart';
import 'package:working_with_bloc_cubit/data/services/api_service/api_service.dart';

final myLocator = GetIt.instance;

setUpLocators()  {
  myLocator.registerLazySingleton(() => ApiService());
}