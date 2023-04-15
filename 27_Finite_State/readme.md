# 3 Point yang sudah dipelajari di Materi Finite State

## 1. Mempelajari tentang apa itu Finite State Machine
Finite State Machine adalah mesin yang memiliki sejumlah state, tiap state menunjukkan apa yang terjadi sebelumnya. Keunggulan Finite State Machine adalah dapat mempermudah dalam menentukan state berikutnya. 

## 2. Mempelajari tentang Contoh Finite State 
Terdapat 3 state yang menunjukkan kejadian dalam suatu proses. Iddle saat tidak terjadi proses, Running saat proses sedang berjalan. Error saat proses gagal diselesaikan. Contoh Sukses, Iddle berubah menjadi Running saat proses berjalan, Running kembali Iddle saat proses selesai. Contoh Gagal, Iddle berubah menjadi Running saat proses berjalan, Running berubah menjadi Error saat proses gagal diselesaikan.

## 3. Mempelajari tentnag Menambah Enum
Mempelajari cara membuat enum untuk masing masing state:<br>
- none saat IDDLE <br>
- loading saat RUNNING <br>
- error saat ERROR <br>