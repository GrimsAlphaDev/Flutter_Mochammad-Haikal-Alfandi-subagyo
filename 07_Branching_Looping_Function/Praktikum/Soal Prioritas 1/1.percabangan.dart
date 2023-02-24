import 'dart:io';

void main(List<String> args) {
  stdout.write("Masukkan Nilai: ");
  int Nilai = int.parse(stdin.readLineSync()!);

  print(getNilai(Nilai));
}

String getNilai(int Nilai) {
  String hasil;

  if (Nilai > 70) {
    hasil = "A";
  } else if (Nilai > 40) {
    hasil = "B";
  } else if (Nilai > 0) {
    hasil = "C";
  } else {
    hasil = "";
  }

  return hasil;
}
