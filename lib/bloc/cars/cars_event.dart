abstract class CarsEvent{}

class FetchAllCars extends CarsEvent{}

class FetchSingleCar extends CarsEvent{
  FetchSingleCar(this.id);
  final int id;
}