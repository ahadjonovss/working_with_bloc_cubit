abstract class AreaState{}

class InitialState extends AreaState{
  InitialState({required this.a,required this.b});

  num a;
  num b;
}


class CircleState extends AreaState{
  CircleState(this.circleArea);
  num circleArea = 0;
}

class RectangleState extends AreaState{
  RectangleState(this.rectangleArea);
  num rectangleArea = 0;
}

class SquareState extends AreaState{
  SquareState(this.squareArea);
  num squareArea = 0;
}