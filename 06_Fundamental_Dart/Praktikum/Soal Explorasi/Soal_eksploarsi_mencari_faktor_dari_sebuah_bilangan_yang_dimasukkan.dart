// Soal = Buatlah sebuah program untuk mencari faktor dari sebuah bilangan yang dimasukkan.

import 'dart:io';

void main() {
  int bilangan;

  stdout.write("Masukan Bilangan = ");
  bilangan = int.parse(stdin.readLineSync()!);

  faktorChecker(bilangan);
}

void faktorChecker(int bilangan) {
  String faktor = "";
  // loop from 1 to bilangan
  for (int i = 1; i < bilangan; i++) {
    //  check if i is a factor of bilangan
    //  if bilangan mod i is 0, then i is a factor
    if (bilangan % i == 0) {
      //  print i as a factor
      faktor = i.toString();
      print(faktor);
    }
  }
}
