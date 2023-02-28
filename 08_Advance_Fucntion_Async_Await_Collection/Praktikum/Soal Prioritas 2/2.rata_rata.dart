void main(List<String> args) {
  List datas = [7, 5, 3, 5, 2, 1];

  print(getRataRata(datas));
}

int getRataRata(List datas) {
  double total = 0;
  for (var data in datas) {
    total += data;
  }
  double rataRata = total / datas.length;
  return rataRata.ceil();
}
