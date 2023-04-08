import 'package:flutter/material.dart';

class AdvanceContact {
  // ignore: prefer_final_fields
  List<Map> contacts = [];
  late int? id;
  late String? name;
  late String? nomor;
  late dynamic date;
  late dynamic color;
  late dynamic file;

  AdvanceContact(
      {this.name, this.nomor, this.id, this.date, this.color, this.file});

  void addContacts(
      {required String name,
      required String nomor,
      required context,
      required date,
      required color,
      required file}) {
    // create id for each contact
    id = contacts.length + 1;
    contacts.add({
      'name': name,
      'nomor': nomor,
      'id': id,
      'date': date,
      'color': color,
      'file': file
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Kontak Berhasil Ditambahkan'),
      ),
    );
  }

  void removeContacts({required int id, required context}) {
    contacts.removeWhere((element) => element['id'] == id);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Kontak Berhasil Dihapus'),
      ),
    );
  }

  void editContacts(
      {required int id,
      required String name,
      required String nomor,
      required context,
      required date,
      required color,
      required file}) {
    contacts[id - 1]['name'] = name;
    contacts[id - 1]['nomor'] = nomor;
    contacts[id - 1]['date'] = date;
    contacts[id - 1]['color'] = color;
    contacts[id - 1]['file'] = file;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Kontak Berhasil Diedit'),
      ),
    );
  }
}
