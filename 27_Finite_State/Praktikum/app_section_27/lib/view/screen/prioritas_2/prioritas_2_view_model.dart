import 'dart:io';

import 'package:app_section_27/model/contacts_model.dart';
import 'package:app_section_27/repository/contact_repository.dart';
import 'package:app_section_27/utils/state/finit_state.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Prioritas2ViewModel with ChangeNotifier {
  MyState myState = MyState.initial;

  late Database database;
  final _contactsrepo = ContactsRepository();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final dateController = TextEditingController();
  final colorController = TextEditingController();
  final fileController = TextEditingController();

  List<ContacsModel> contacts = [];

  Future<void> initDatabase() async {
    myState = MyState.loading;
    notifyListeners();
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'contacts.db');
    if (await Directory(dirname(path)).exists()) {
      database = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, nomor TEXT, date TEXT, color TEXT, file TEXT)');
      });
      myState = MyState.loaded;
      notifyListeners();
    } else {
      myState = MyState.loading;
      notifyListeners();
      try {
        await Directory(dirname(path)).create(recursive: true);
        database = await openDatabase(path, version: 1,
            onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, nomor TEXT, date TEXT, color TEXT, file TEXT)');
        });
        myState = MyState.loaded;

        debugPrint(database.toString());
        notifyListeners();
      } catch (e) {
        debugPrint(e.toString());
        myState = MyState.failed;
        notifyListeners();
      }
    }
  }

  Future getContacts() async {
    myState = MyState.initial;
    try {
      myState = MyState.loading;
      contacts = await _contactsrepo.getContact(database: database);
      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
      myState = MyState.failed;
      notifyListeners();
    }
  }

  Future addContact({
    required String name,
    required String nomor,
    required String date,
    required String color,
    required String file,
    BuildContext? context,
  }) async {
    myState = MyState.initial;
    try {
      myState = MyState.loading;
      await _contactsrepo.addContact(
        database: database,
        name: name,
        nomor: nomor,
        date: date,
        color: color,
        file: file,
      );
      myState = MyState.loaded;
      getContacts();
      if (context != null) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Contact Added'),
          ),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      myState = MyState.failed;
      notifyListeners();
    }
  }

  Future<void> removeContact({
    required int id,
  }) async {
    myState = MyState.initial;
    try {
      myState = MyState.loading;
      await _contactsrepo.removeContact(
        database: database,
        id: id,
      );
      myState = MyState.loaded;
      getContacts();
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
      myState = MyState.failed;
      notifyListeners();
    }
  }

  Future<void> updateContact({
    required int id,
    required String name,
    required String nomor,
    required String date,
    required String color,
    required String file,
    required BuildContext context,
  }) async {
    myState = MyState.initial;
    try {
      myState = MyState.loading;
      await _contactsrepo.updateContact(
        database: database,
        id: id,
        name: name,
        nomor: nomor,
        date: date,
        color: color,
        file: file,
      );
      myState = MyState.loaded;
      getContacts();
      notifyListeners();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Contact Updated'),
        ),
      );
    } catch (_) {
      rethrow;
    }
  }
}
