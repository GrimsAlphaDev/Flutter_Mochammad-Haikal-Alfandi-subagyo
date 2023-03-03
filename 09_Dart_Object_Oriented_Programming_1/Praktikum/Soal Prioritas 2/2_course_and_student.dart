void main() {
  // inisisasi objek course
  Course course1 = Course();
  Course course2 = Course();
  Course course3 = Course();

  // isi property judul dan deskripsi
  course1.judul = 'Belajar Dart';
  course1.deskripsi = 'Belajar Dart OOP';

  course2.judul = 'Belajar Flutter';
  course2.deskripsi = 'Belajar Flutter Secara Mudah';

  course3.judul = 'Belajar CSS';
  course3.deskripsi = 'Belajar CSS untuk Pemula';

  // inisisasi objek student
  Student student1 = Student();
  Student student2 = Student();
  // isi property nama dan kelas
  student1.nama = 'Dwayne';
  student1.kelas = 'Dart';
  student2.nama = 'Johnson';
  student2.kelas = 'Flutter';
  // isi property daftarCourse
  student1.daftarCourse = [];
  student2.daftarCourse = [];

  // tambahkan course ke dalam daftarCourse
  student1.addCourse(course1);
  student1.addCourse(course3);
  student2.addCourse(course2);
  student2.addCourse(course3);

  // hapus course dari daftarCourse
  student1.hapusCourse(course3);
  student2.hapusCourse(course3);

  // lihat daftarCourse
  student1.lihatCourse();
  print("=====================================");
  student2.lihatCourse();
}

class Course {
  late String judul;
  late String deskripsi;
}

class Student {
  late String nama;
  late String kelas;
  late List daftarCourse;

  void addCourse(Course course) {
    daftarCourse.add(course);
  }

  void hapusCourse(Course course) {
    daftarCourse.remove(course);
  }

  void lihatCourse() {
    print('Daftar Course yang diambil oleh $nama');
    for (var i = 0; i < daftarCourse.length; i++) {
      print('Course ke-${i + 1}');
      print('Judul: ${daftarCourse[i].judul}');
      print('Deskripsi: ${daftarCourse[i].deskripsi}');
    }
  }
}
