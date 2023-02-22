import 'dart:io';

void main() {
  var rumuskelilingPersegi = "4 x sisi";
  var rumusluasPersegi = "sisi x sisi";

  var rumuskelilingPersegiPanjang = "2 x (Panjang + Lebar)";
  var rumusluasPersegiPanjang = "panjang x lebar";

  var sisi;
  var panjang;
  var lebar;

  print('Keliling dan luas persegi');
  print('Rumus untuk mencari keliling persegi =  $rumuskelilingPersegi');
  print('Rumus untuk mencari luas persegi = $rumusluasPersegi');

  // masukan sisi
  stdout.write("Masukan sisi: ");
  sisi = stdin.readLineSync();
  sisi = int.parse(sisi);

  // rumus keliling persegi
  var KelilingPersegi = 4 * sisi;
  var luasPersegi = sisi * sisi;
  print("Keliling Persegi: $KelilingPersegi");

  print("Luas Persegi: $luasPersegi ");

  print("----------------------------------------");

  print('Keliling dan luas persegi panjang');
  print(
      'Rumus untuk mencari keliling Persegi Panjang = $rumuskelilingPersegiPanjang');
  print('Rumus untuk mencari luas persegi panjang = $rumusluasPersegiPanjang');

  stdout.write("Masukan Panjang: ");
  panjang = stdin.readLineSync();
  panjang = int.parse(panjang);

  stdout.write("Masukan Lebar: ");
  lebar = stdin.readLineSync();
  lebar = int.parse(lebar);

  var luasPersegiPanjang = panjang * lebar;
  var kelilingPersegiPanjang = 2 * (panjang + lebar);

  print("Keliling Persegi Panjang: $kelilingPersegiPanjang");

  print("Luas Persegi Panjang: $luasPersegiPanjang");
}
