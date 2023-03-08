void main(List<String> args) {
  // Menghitung luas dan keliling lingkaran
  print('======= Lingkaran ========');

  Circle circle = Circle(radius: 7);

  print('Luas Lingkaran Dari Radius 7 adalah : ${circle.getArea()}');
  print('Keliling Lingkaran Dari Radius 7 adalah : ${circle.getPerimeter()}');

  // Menghitung luas dan keliling persegi
  print('======= Persegi ========');

  Square square = Square(side: 5);

  print('Luas Persegi Dari Sisi 5 adalah : ${square.getArea()}');
  print('Keliling Persegi Dari Sisi 5 adalah : ${square.getPerimeter()}');

  // Menghitung luas dan keliling persegi panjang

  print('======= Persegi Panjang ========');

  Rectangle rectangle = Rectangle(width: 5, height: 10);

  print(
      'Luas Persegi Panjang Dari Panjang 5 dan Lebar 10 adalah : ${rectangle.getArea()}');

  print(
      'Keliling Persegi Panjang Dari Panjang 5 dan Lebar 10 adalah : ${rectangle.getPerimeter()}');
}

abstract class Shape {
  int getArea() {
    return 0;
  }

  int getPerimeter() {
    return 0;
  }
}

class Circle implements Shape {
  final int radius;
  final double pi = 3.14;

  Circle({required this.radius});

  @override
  int getArea() => (pi * radius * radius).toInt();

  @override
  int getPerimeter() => (2 * pi * radius).toInt();
}

class Square implements Shape {
  final int side;

  Square({required this.side});

  @override
  int getArea() => side * side;

  @override
  int getPerimeter() => 4 * side;
}

class Rectangle implements Shape {
  final int width;
  final int height;

  Rectangle({required this.width, required this.height});

  @override
  int getArea() => width * height;

  @override
  int getPerimeter() => 2 * (width + height);
}
