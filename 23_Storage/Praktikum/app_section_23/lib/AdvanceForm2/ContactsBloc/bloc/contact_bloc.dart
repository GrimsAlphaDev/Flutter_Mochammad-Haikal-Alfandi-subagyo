import 'dart:developer';

import 'package:app_section_23/AdvanceForm2/Model/contacs_model.dart';
import 'package:app_section_23/AdvanceForm2/Repositories/contacts.repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

part 'contact_state.dart';

class ContactBloc extends Cubit<ContactState> {
  final _contactsrepo = ContactsRepository();
  final Database database;

  ContactBloc({required this.database}) : super(ContactInitial());

  List<ContacsModel> _contacts = [];
  List<ContacsModel> get contacts => _contacts;

  Future<void> getContacts() async {
    try {
      _contacts = await _contactsrepo.getContact(database: database);
      emit(ContactInitial());
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> addContact({
    required String name,
    required String nomor,
    required String date,
    required String color,
    required String file,
    required BuildContext context,
  }) async {
    try {
      await _contactsrepo.addContact(
        database: database,
        name: name,
        nomor: nomor,
        date: date,
        color: color,
        file: file,
      );
      emit(AddContactState());
      getContacts();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Contact Added'),
        ),
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> removeContact({
    required int id,
  }) async {
    try {
      await _contactsrepo.removeContact(
        database: database,
        id: id,
      );
      emit(RemoveContactState());
      getContacts();
    } catch (_) {
      rethrow;
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
    try {
      await _contactsrepo.updateContact(
        database: database,
        id: id,
        name: name,
        nomor: nomor,
        date: date,
        color: color,
        file: file,
      );
      emit(UpdateContactState());
      getContacts();
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
