import 'dart:io';

void main(List<String> args) {
  BigInt number;

  stdout.write("Masukkan Bilangan: ");
  number = BigInt.parse(stdin.readLineSync()!);
  BigInt hasil = getFaktorial(number.toInt());

  // format hasil output menjadi ada titik setiap 3 digit
  print(
      "Hasil Faktorial: ${hasil.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}");
}

// change getFaktorial to big Int
BigInt getFaktorial(int number) {
  BigInt hasil = BigInt.one;

  for (int i = 1; i <= number; i++) {
    hasil *= BigInt.from(i);
  }

  return hasil;
}
