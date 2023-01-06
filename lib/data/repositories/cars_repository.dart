import 'package:working_with_bloc_cubit/data/services/api_service/api_service.dart';
import 'package:working_with_bloc_cubit/utils/get_it.dart';

class CarsRepository{
  getAllCars()=>myLocator<ApiService>().getAllCars();
}