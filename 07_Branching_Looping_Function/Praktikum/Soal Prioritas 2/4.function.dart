import 'dart:io';

void main(List<String> args) {
  final double pi = 3.14;

  double jari_jari;

  stdout.write("Masukkan Jari-jari: ");
  jari_jari = double.parse(stdin.readLineSync()!);

  double luas = getLuasLingkaran(jari_jari, pi);
  print(luas.toStringAsFixed(2));
}

double getLuasLingkaran(double jari_jari, double pi) {
  double luas = pi * jari_jari * jari_jari;

  return luas;
}
