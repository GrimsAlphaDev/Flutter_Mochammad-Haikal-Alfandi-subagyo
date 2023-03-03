void main() {
  Book book = Book();

  book.tambahBuku('KB001', 'Dilan 1990', 'Gramedia', 'drama');
  book.tambahBuku('KB002', 'Rich Dad Poor Dad', 'Gramedia', 'bisnis');
  book.tambahBuku('KB003', 'Berani Mengubah', 'Gramedia', 'motivasi');

  book.getDataBuku();

  print("Hapus buku dilan");
  book.hapusBuku('KB001');

  book.getDataBuku();
}

class Book {
  late String idBuku;
  late String judul;
  late String penerbit;
  late String kategori;
  late Map dataBuku = {};

  void tambahBuku(
      String idBuku, String judul, String penerbit, String kategori) {
    dataBuku.addAll({
      idBuku: {'judul': judul, 'penerbit': penerbit, 'kategori': kategori}
    });
  }

  void hapusBuku(String idBuku) {
    dataBuku.remove(idBuku);
  }

  void getDataBuku() {
    dataBuku.forEach((key, value) {
      print('======================');
      print('ID Buku: $key');
      print('Judul: ${value['judul']}');
      print('Penerbit: ${value['penerbit']}');
      print('Kategori: ${value['kategori']}');
      print('======================');
    });
  }
}
