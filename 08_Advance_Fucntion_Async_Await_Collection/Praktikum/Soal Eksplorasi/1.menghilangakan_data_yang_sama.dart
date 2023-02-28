void main(List<String> args) {
  List datas = [
    'amuse',
    'tommy kaira',
    'spoon',
    'HKS',
    'litchfield',
    'amuse',
    'HKS'
  ];
  List datas2 = [
    'JS Racing', 
    'amuse', 
    'spoon', 
    'spoon', 
    'JS Racing', 
    'amuse'
    ];

  Unique(datas);
  Unique(datas2);
}

void Unique(List datas) {
  List hasil = [];
  for (var data in datas) {
    if (!hasil.contains(data)) {
      // jika di dalam list hasil tidak ada data yang sama dengan data yang ada di list datas
      // maka tambahkan data tersebut ke dalam list hasil
      hasil.add(data);
    }
  }
  print(hasil);
}
