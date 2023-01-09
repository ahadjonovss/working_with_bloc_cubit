import 'package:dio/dio.dart';
import 'package:working_with_bloc_cubit/data/models/car_full_info.dart';

import '../../models/car_model.dart';
import '../../models/my_reponse.dart';
import 'api_client.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getAllCars() async {
    // Dio dio = Dio();
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response =
          await dio.get("https://easyenglishuzb.free.mockoapp.net/companies");
      if (response.statusCode == 200) {
        myResponse.data = Car.fromJson(response.data);
      }
    } catch (err) {
      myResponse.error = err.toString();
      //print(err.toString());
    }

    return myResponse;
  }

  Future<MyResponse> getSingleCar(int id) async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio
          .get("https://easyenglishuzb.free.mockoapp.net/companies/id");
      if (response.statusCode == 200) {
        myResponse.data = CarFullInfo.fromJson(response.data);
      }
    } catch (e) {
      myResponse.error = e.toString();
    }
    return myResponse;
  }
}
