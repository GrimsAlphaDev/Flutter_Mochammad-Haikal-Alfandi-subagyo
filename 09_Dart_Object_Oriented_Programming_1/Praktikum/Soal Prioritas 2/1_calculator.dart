void main() {
  print('Kalkulator Sederhana');

  // instansiasi objek calculator
  Calculator calculator = Calculator();

  calculator.penjumlahan(10, 5);
  calculator.pengurangan(10, 5);
  calculator.perkalian(10, 5);
  calculator.pembagian(10, 5);
}

class Calculator {
  // method untuk menjumlahkan 2 bilangan
  void penjumlahan(double a, double b) {
    double hasil;
    hasil = a + b;

    print('Hasil Penjumlahan dari : $a + $b = $hasil');
  }

  // method untuk mengurangkan 2 bilangan
  void pengurangan(double a, double b) {
    double hasil;
    hasil = a - b;

    print('Hasil Pengurangan dari : $a - $b = $hasil');
  }

  // method untuk mengalikan 2 bilangan
  void perkalian(double a, double b) {
    double hasil;
    hasil = a * b;

    print('Hasil Perkalian dari : $a * $b = $hasil');
  }

  // method untuk membagi 2 bilangan
  void pembagian(double a, double b) {
    double hasil;
    hasil = a / b;

    print('Hasil Pembagian dari : $a / $b = $hasil');
  }
}
