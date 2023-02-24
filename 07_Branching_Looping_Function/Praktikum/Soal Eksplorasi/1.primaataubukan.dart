import 'dart:io';

void main(List<String> args) {
  stdout.write("Masukkan Bilangan: ");
  int bilangan = int.parse(stdin.readLineSync()!);

  print(primaataubukan(bilangan: bilangan));
}

String primaataubukan({required int bilangan}) {
  String hasil;

  if (bilangan % 2 == 0) {
    hasil = "Bukan Bilangan Prima";
  } else {
    hasil = "Bilangan Prima";
  }

  return hasil;
}
