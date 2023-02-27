import 'dart:io';

void main(List<String> args) {
  stdout.write("Masukkan Nilai: ");
  int nilai = int.parse(stdin.readLineSync()!);

  print(getNilai(nilai));
}

String getNilai(int nilai) {
  String hasil;

  if (nilai > 70) {
    hasil = "A";
  } else if (nilai > 40) {
    hasil = "B";
  } else if (nilai > 0) {
    hasil = "C";
  } else {
    hasil = "";
  }

  return hasil;
}
