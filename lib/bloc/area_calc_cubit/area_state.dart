abstract class AreaState{}




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