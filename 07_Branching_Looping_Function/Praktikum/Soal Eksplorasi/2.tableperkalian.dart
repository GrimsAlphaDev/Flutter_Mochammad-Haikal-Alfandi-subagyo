import 'dart:io';

void main(List<String> args) {
  stdout.write("Masukkan Bilangan: ");
  int bilangan = int.parse(stdin.readLineSync()!);

  getTablePerkalian(bilangan);
}

dynamic getTablePerkalian(int number) {
  for (int i = 1; i <= number; i++) {
    for (int j = 1; j <= number; j++) {
      stdout.write("${i * j} ");
      // if the number is 1 digit then add a space
      if (i * j < 10) {
        stdout.write(" ");
      }
    }
    print("");
  }
}
