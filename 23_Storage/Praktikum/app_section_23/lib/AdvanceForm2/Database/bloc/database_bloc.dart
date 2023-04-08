import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

part 'database_state.dart';

class DatabaseBloc extends Cubit<DatabaseState> {
  DatabaseBloc() : super(DatabaseInitial());

  Database? database;

  Future<void> initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'contacts.db');
    if (await Directory(dirname(path)).exists()) {
      await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, nomor TEXT, date TEXT, color TEXT, file TEXT)');
      });
      emit(LoadDatabaseState());
    } else {
      try {
        await Directory(dirname(path)).create(recursive: true);
        database = await openDatabase(path, version: 1,
            onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, nomor TEXT, date TEXT, color TEXT, file TEXT)');
        });
        emit(LoadDatabaseState());
      } catch (_) {
        rethrow;
        // rethrow is used to rethrow the exception
      }
    }
  }
}
