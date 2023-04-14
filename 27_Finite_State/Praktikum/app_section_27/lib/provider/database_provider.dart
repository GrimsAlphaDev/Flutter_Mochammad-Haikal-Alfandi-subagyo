import 'dart:io';

import 'package:app_section_27/utils/state/finit_state.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider extends ChangeNotifier {
  MyState myState = MyState.initial;

  Database? database;

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
}
