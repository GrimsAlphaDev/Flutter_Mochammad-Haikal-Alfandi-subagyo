import 'dart:io';

void main(List<String> args) {
  print("========== KPK ==========");
  print("Masukkan bilangan pertama: ");
  int x = int.parse(stdin.readLineSync()!);
  print("Masukkan bilangan kedua: ");
  int y = int.parse(stdin.readLineSync()!);

  KelipatanPersekutuanTerkecil kpk =
      KelipatanPersekutuanTerkecil(x: x.toDouble(), y: y.toDouble());

  print("KPK dari $x dan $y adalah ${kpk.hasil().toString()}");

  print("========== FPB ==========");
  print("Masukkan bilangan pertama: ");
  x = int.parse(stdin.readLineSync()!);
  print("Masukkan bilangan kedua: ");
  y = int.parse(stdin.readLineSync()!);

  FaktorPersekutuanTerbesar fpb =
      FaktorPersekutuanTerbesar(x: x.toDouble(), y: y.toDouble());

  print("FPB dari $x dan $y adalah ${fpb.hasil().toString()}");
}

class Matematika {
  double hasil() {
    return 0;
  }
}

class KelipatanPersekutuanTerkecil implements Matematika {
  late double x;
  late double y;

  KelipatanPersekutuanTerkecil({required this.x, required this.y});

  @override
  double hasil() {
    // Faktorisasi prima untuk bilangan a
    List<int> faktorA = [];
    int temp = x.toInt();
    for (int i = 2; i <= temp; i++) {
      while (temp % i == 0) {
        faktorA.add(i);
        temp = temp ~/ i;
      }
    }

    /// note ~/ adalah operator di bahasa pemrograman Dart yang digunakan untuk melakukan pembagian bilangan bulat. Misalnya, 7 ~/ 2 akan menghasilkan 3, bukan 3.5. Operator ini juga dapat ditimpa oleh objek Dart, sehingga dapat berarti apa pun yang Anda inginkan

    // Faktorisasi prima untuk bilangan b
    List<int> faktorB = [];
    temp = y.toInt();
    for (int i = 2; i <= temp; i++) {
      while (temp % i == 0) {
        faktorB.add(i);
        temp = temp ~/ i;
      }
    }

    // Menggabungkan faktor prima dari a dan b
    List<int> faktorGabung = [];
    for (int i = 0; i < faktorA.length; i++) {
      faktorGabung.add(faktorA[i]);
      faktorB.remove(faktorA[i]);
    }

    faktorGabung.addAll(faktorB);
    // Menghitung KPK dari hasil perkalian faktor prima
    double hasil = 1;
    for (int i = 0; i < faktorGabung.length; i++) {
      hasil = hasil * faktorGabung[i];
    }
    return hasil;
  }
}

class FaktorPersekutuanTerbesar implements Matematika {
  late double x;
  late double y;

  FaktorPersekutuanTerbesar({required this.x, required this.y});

  double hasil() {
    // fpb
    double hasil = 1;
    for (int i = 1; i <= x; i++) {
      if (x % i == 0 && y % i == 0) {
        hasil = i.toDouble();
      }
    }
    return hasil;
  }
}
