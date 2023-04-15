import 'package:app_section_27/model/contacts_model.dart';
import 'package:sqflite/sqflite.dart';

class ContactsRepository {
  Future<dynamic> getContact({
    required Database database,
  }) async {
    return await database.transaction((txn) async {
      final datas = await txn.rawQuery('SELECT * FROM contacts');
      List<ContacsModel> contacts = [];
      for (var item in datas) {
        contacts.add(
          ContacsModel(
            id: item['id'] as int,
            name: item['name'].toString(),
            nomor: item['nomor'].toString(),
            date: item['date'].toString(),
            color: item['color'].toString(),
            file: item['file'].toString(),
          ),
        );
      }
      return contacts;
    });
  }

  Future<dynamic> addContact({
    required Database database,
    required String name,
    required String nomor,
    required String date,
    required String color,
    required String file,
  }) async {
    return await database.transaction((txn) async {
      await txn.rawInsert(
          "INSERT INTO contacts(name, nomor, date, color, file) VALUES('$name', '$nomor', '$date', '$color', '$file')");
    });
  }

  Future<dynamic> removeContact({
    required Database database,
    required int id,
  }) async {
    return await database.transaction((txn) async {
      await txn.rawDelete('DELETE FROM contacts WHERE id = $id');
    });
  }

  Future<dynamic> updateContact({
    required Database database,
    required int id,
    required String name,
    required String nomor,
    required String date,
    required String color,
    required String file,
  }) async {
    return await database.transaction((txn) async {
      await txn.rawUpdate(
          "UPDATE contacts SET name = '$name', nomor = '$nomor', date = '$date', color = '$color', file = '$file' WHERE id = $id");
    });
  }
}
