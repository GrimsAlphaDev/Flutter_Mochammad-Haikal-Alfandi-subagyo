void main(List<String> args) {
  final Kubus kubus = Kubus(sisi: 5);

  print("Volume Kubus Dengan Sisi 5 adalah =  " +
      kubus.volume().toStringAsFixed(0));

  final Balok balok = Balok(panjang: 5, lebar: 10, tinggi: 15);

  print("Volume Balok Dengan Panjang 5, Lebar 10, Tinggi 15 adalah =  " +
      balok.volume().toStringAsFixed(0));
}

class BangunRuang {
  double? panjang;
  double? lebar;
  double? tinggi;

  BangunRuang({this.panjang, this.lebar, this.tinggi});

  double volume() {
    return 0;
  }
}

class Kubus extends BangunRuang {
  double sisi;

  Kubus({required this.sisi});

  @override
  double volume() {
    return sisi * sisi * sisi;
  }
}

class Balok extends BangunRuang {
  Balok({required super.panjang, required super.lebar, required super.tinggi});
  // : super(panjang: panjang, lebar: lebar, tinggi: tinggi
  // );

  @override
  double volume() {
    return (panjang ?? 0) * (lebar ?? 0) * (tinggi ?? 0);
  }
}
