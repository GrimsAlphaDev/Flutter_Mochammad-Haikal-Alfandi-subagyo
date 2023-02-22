// Soal = Buatlah sebuah program untuk mengecek apakah sebuah kata merupakan sebuah palindrom atau bukan

import 'dart:io';

void main() {
  String kata;

  stdout.write("Masukan Kata = ");
  // aman menggunakan bang operator (!) karena jika tidak menginputkan apapun akan mengembalikan nilai string kosong "" jadi tidak mungkin null
  kata = stdin.readLineSync()!;

  print(palindromChecker(kata));
}

String palindromChecker(String kata) {
  // kata.split('') = split the word into array of character
  // .reversed = reverse the array
  // .join('') = join the array into string
  
  String reverse = kata.split('').reversed.join('');

  if (kata == reverse) {
    return "Kata ${kata} jika dibalik adalah ${reverse} sehingga kata ini merupakan Palindrom";
  } else {
    return "Kata ${kata} jika dibalik adalah ${reverse} sehingga kata ini bukan Palindrom";
  }
}
