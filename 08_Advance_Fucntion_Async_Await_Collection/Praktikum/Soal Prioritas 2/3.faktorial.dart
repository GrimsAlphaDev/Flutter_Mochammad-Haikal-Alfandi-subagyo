import 'dart:io';

void main(List<String> args) async {
  stdout.write('Masukan Bilangan Yang Akan Di Faktorialkan : ');
  int bilangan = int.parse(stdin.readLineSync()!);

  int hasil = await Faktorial(bilangan);

  print('Faktorial dari $bilangan adalah ${hasil}');
}

Future<int> Faktorial(int bilangan) async {
  int hasil = 1;
  return Future.delayed(Duration(seconds: 1), () {
    for (int i = 1; i <= bilangan; i++) {
      hasil *= i;
    }
    return hasil;
  });
}
