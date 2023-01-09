abstract class CarsEvent{}

class FetchAllCarsEvent extends CarsEvent{}

class FetchSingleCarEvent extends CarsEvent{
  FetchSingleCarEvent(this.id);
  final int id;
}