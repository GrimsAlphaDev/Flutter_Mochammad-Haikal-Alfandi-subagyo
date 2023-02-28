void main(List<String> args) {
  List datas = [
    'js',
    'js',
    'js',
    'golang',
    'python',
    'js',
    'js',
    'golang',
    'rust'
  ];

  getFrekuensi(datas);
}

void getFrekuensi(List datas) {
  List hasil = [];
  for (var data in datas) {
    if (!hasil.contains(data)) {
      hasil.add(data);
    }
  }
  // hasil berisikan data yang unik
  //  [js, golang, python, rust]

  for (var data in hasil) {
    int frekuensi = 0;
    // cari frekuensi data
    for (var data2 in datas) {
      //  jika data yang ada di list datas sama dengan data yang ada di list hasil
      //  maka tambahkan frekuensi
      if (data == data2) {
        frekuensi++;
      }
    }

    // print frekuensi
    print('$data : $frekuensi');
  }
}
