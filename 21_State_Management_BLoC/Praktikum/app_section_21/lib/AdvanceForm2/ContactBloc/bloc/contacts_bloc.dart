import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc() : super(ContactsInitial()) {
    final List<Map<String, dynamic>> contacts = [];

    on<ContactsEventAdd>((event, emit) async {
      emit(ContactsStateLoading());
      try {
        contacts.add(
          {
            'name': event.name,
            'nomor': event.nomor,
            'id': contacts.length + 1,
            'date': event.tanggal,
            'color': event.color,
            'file': event.file
          },
        );

        await Future.delayed(
          const Duration(seconds: 2),
        );

        ScaffoldMessenger.of(event.context).showSnackBar(
          const SnackBar(
            content: Text('Kontak Berhasil Ditambahkan'),
          ),
        );

        emit(ContactsStateSuccess(contacts));
      } catch (e) {
        emit(ContactsStateError(e.toString()));
      }
    });

    on<ContactsEventDelete>((event, emit) async {
      emit(ContactsStateLoading());
      try {
        contacts.removeWhere((element) => element['id'] == event.id);

        await Future.delayed(
          const Duration(seconds: 2),
        );

        emit(ContactsStateSuccess(contacts));
      } catch (e) {
        emit(ContactsStateError(e.toString()));
      }
    });

    on<ContactEventEdit>((event, emit) async {
      emit(ContactsStateLoading());
      try {
        contacts[event.id - 1]['name'] = event.name;
        contacts[event.id - 1]['nomor'] = event.nomor;
        contacts[event.id - 1]['date'] = event.tanggal;
        contacts[event.id - 1]['color'] = event.color;
        contacts[event.id - 1]['file'] = event.file;

        await Future.delayed(
          const Duration(seconds: 2),
        );

        emit(ContactsStateSuccess(contacts));
      } catch (e) {
        emit(ContactsStateError(e.toString()));
      }
    });
  }
}
