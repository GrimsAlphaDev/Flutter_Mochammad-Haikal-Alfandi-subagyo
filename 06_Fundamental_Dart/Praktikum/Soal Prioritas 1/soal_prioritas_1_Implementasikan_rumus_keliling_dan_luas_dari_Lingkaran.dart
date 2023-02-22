import 'dart:io';

void main() {
  double pi = 3.14;
  var r;

  print("Rumus Keliling & Luas Lingkaran");
  stdout.write("Masukan Jari-jari: ");

  // r = jari jari
  // read input from user
  r = stdin.readLineSync();
  // parse input from string to double
  r = double.parse(r);

  var keliling = 2 * pi * r;
  var luas = pi * r * r;

  print("Keliling Lingkaran: $keliling");
  print("Luas Lingkaran: $luas");
}
