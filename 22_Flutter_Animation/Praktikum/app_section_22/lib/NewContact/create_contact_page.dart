import 'package:flutter/material.dart';

class CreateContacts extends StatelessWidget {
  const CreateContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              // decrease textfield height
              decoration: const InputDecoration(
                hintText: 'Insert Your Name',
                label: Text('Name'),
                contentPadding: EdgeInsets.all(10),
                filled: true,
                fillColor: Color.fromARGB(255, 240, 228, 237),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Masukan Nama Anda Terlebih Dahulu';
                }

                if (value.split(' ').length < 2) {
                  return 'Nama Harus Memiliki 2 Kata';
                }

                if (value[0] != value[0].toUpperCase()) {
                  return 'Nama Harus Dimulai Dengan Huruf Besar';
                }

                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: '+62 ......',
                label: Text('Nomor'),
                filled: true,
                fillColor: Color.fromARGB(255, 240, 228, 237),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Masukan Nomor Anda Terlebih Dahulu';
                }

                if (value.length <= 8 || value.length >= 15) {
                  return 'Nomor Tidak Boleh Kurang Dari 8 Dan Lebih Dari 15';
                }

                if (value[0] != '0') {
                  return 'Nomor Harus Dimulai Dengan 0';
                }

                return null;
              },
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 98, 51, 141)),
                  ),
                  onPressed: () {
                    // alert dialog
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Success'),
                          content: const Text('Contact Created'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text(
                    '  Submit  ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
