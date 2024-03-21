import 'dart:math';
import 'dart:io';

// Define an interface
abstract class Shape {
  double calculateArea();
}

// Implement classes using inheritance
class Rectangle implements Shape {
  double length;
  double width;

  Rectangle(this.length, this.width);

  @override
  double calculateArea() {
    return length * width;
  }
}

class Circle implements Shape {
  double radius;

  Circle(this.radius);

  @override
  double calculateArea() {
    return pi * pow(radius, 2);
  }
}

// Class that overrides an inherited method
class Square extends Rectangle {
  Square(double side) : super(side, side);
}

// Method to read data from a file and initialize objects
List<Shape> initializeFromFile(String filename) {
  List<Shape> shapes = [];

  final file = File(filename);
  final lines = file.readAsLinesSync();

  for (var line in lines) {
    var shapeData = line.split(',');
    if (shapeData[0] == 'rectangle') {
      shapes.add(Rectangle(double.parse(shapeData[1]), double.parse(shapeData[2])));
    } else if (shapeData[0] == 'circle') {
      shapes.add(Circle(double.parse(shapeData[1])));
    }
  }

  return shapes;
}

// Method demonstrating the use of a loop
void printAreas(List<Shape> shapes) {
  for (var shape in shapes) {
    var area = shape.calculateArea();
    if (shape is Rectangle) {
      print('Rectangle - Area: $area');
    } else if (shape is Circle) {
      print('Circle - Area: $area');
    }
  }
}

// Main program
void main() {
  // Initialize objects from file
  var shapes = initializeFromFile('shapes.txt');

  // Print areas
  printAreas(shapes);
}
