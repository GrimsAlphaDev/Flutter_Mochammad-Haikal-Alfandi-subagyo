void main() {
  print('Berat Hewan');

  // instansiasi objek hewan
  Hewan ayam = Hewan();
  Hewan sapi = Hewan();
  Hewan kambing = Hewan();

  // isi property berat hewan
  ayam.berat = 10;
  sapi.berat = 100;
  kambing.berat = 50;

  // print berat hewan
  print('Berat Ayam: ${ayam.berat} KG');
  print('Berat Sapi: ${sapi.berat} KG');
  print('Berat Kambing: ${kambing.berat} KG');

  print('Mobil');

  // instansiasi objek mobil
  Mobil mobil = Mobil();

  // masukan hewan ke dalam muatan
  mobil.tambahHewan(ayam);
  mobil.tambahHewan(sapi);
  mobil.tambahHewan(kambing);
  // mobil.tambahHewan(sapi);

  // print muatan
  print('Muatan Berisikan : ${mobil.muatan.length} Hewan');
}

class Hewan {
  // property untuk menyimpan data berat hewan

  // menggunakan late karena property berat akan diisi setelah instansiasi objek
  // late double berat;

  // jika tidak menggunakan late maka property berat harus diisi nilai awal (default)
  double berat = 0;
}

class Mobil {
  // property untuk menyimpan data kapasitas total berat maksimum muatan
  double kapasitas = 200;

  // property untuk menyimpan list data hewan yang menjadi muatan
  List muatan = [];

  // method untuk menambahkan hewan ke dalam list muatan
  void tambahHewan(Hewan hewan) {
    // monitor kapasitas yang sudah terisi
    double terisi;

    // jika berat hewan yang akan ditambahkan ke dalam list muatan
    // kurang dari atau sama dengan kapasitas
    if (hewan.berat <= kapasitas) {
      // tambahkan hewan ke dalam list muatan
      muatan.add(hewan);
      // kurangi kapasitas dengan berat hewan
      kapasitas -= hewan.berat;
      // print hewan berhasil ditambahkan
      print('Hewan Berhasil Ditambahkan');
    } else {
      // jika kapasitas tidak cukup maka tampilkan pesan
      print('Kapasitas Sudah Terpenuhi');
    }
  }
}
