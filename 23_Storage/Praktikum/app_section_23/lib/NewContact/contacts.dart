import 'package:flutter/material.dart';

class Contact {
  // ignore: prefer_final_fields
  List<Map> contacts = [];
  late int? id;
  late String? name;
  late String? nomor;

  Contact({this.name, this.nomor, this.id});

  void addContacts(
      {required String name, required String nomor, required context}) {
    // create id for each contact
    id = contacts.length + 1;
    contacts.add({'name': name, 'nomor': nomor, 'id': id});

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
      required context}) {
    contacts[id - 1]['name'] = name;
    contacts[id - 1]['nomor'] = nomor;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Kontak Berhasil Diedit'),
      ),
    );
  }
}
