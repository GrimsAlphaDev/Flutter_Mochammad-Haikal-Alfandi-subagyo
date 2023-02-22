// soal = Implementasikan rumus volume dari tabung (silinder) dengan menggunakan Bahasa Dart.

import 'dart:io';

void main(List<String> args) {
  print("Volume Tabung");

  stdout.write("Masukkan jari-jari: ");

  int r = int.parse(stdin.readLineSync()!);
  stdout.write("Masukkan tinggi: ");

  int h = int.parse(stdin.readLineSync()!);
  double volume = volume_tabunga(r, h);

  print("Volume tabung adalah ${volume}");
}

double volume_tabunga(int r, int h) {
  double pi = 3.14;
  double volume = pi * (r * r) * h;
  return volume;
}
