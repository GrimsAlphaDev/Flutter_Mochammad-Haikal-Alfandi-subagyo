void main(List<String> args) async {
  List datas = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int pengali = 2;
  List hasil = await getData(datas, pengali);
  print(hasil);
}

Future<List> getData(List datas, int pengali) async {
  List hasil = [];
  return Future.delayed(Duration(seconds: 1), () {
    for (var data in datas) {
      hasil.add(data * pengali);
    }
    return hasil;
  });
}
