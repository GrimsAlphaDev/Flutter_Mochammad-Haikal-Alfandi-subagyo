# 3 Point yang sudah dipelajari di materi Flutter State Management (BLoC)

## 1. Mempelajari tentang Declarative UI
Flutter memiliki sifat declarative yang artinya flutter membangun UInya pada screen untuk mencerminkan keadaan state saat ini. Flutter menggunakan widget sebagai building block untuk membuat UI. Widget adalah sebuah class yang memiliki state dan build method. Widget dapat memiliki state yang dapat berubah dan build method yang akan mengembalikan widget tree. Widget tree adalah sebuah hierarki widget yang akan di render ke screen.

## 2. Mempelajari tentang State
State adalah ketika sebuah widget sedang aktif dan widget tersebut menyimpan data di memori, flutter akan membangun ulang UI nya ketika ada state atu data yang berubah, ada 2 jenis state dalam flutter, ephemeral state dan app state.

## 3. Mempelajari tentang BLoC
BLoC (Business Logic Component) memisahkan antar business logic dengan UI, Mengapa kita memilih BLoC ? beberapa alasan mengapa kita memilih state management BLoC karena Simple, Poweful, dan testable. Cara Kerja Bloc Menerima event sebagai input dianalisa dan dikelola di dalam BLoC dan mengahasilkan state sebagai output