import 'package:working_with_bloc_cubit/data/services/api_service/api_service.dart';


class CarsRepository{
  getAllCars()=>ApiService().getAllCars();
}