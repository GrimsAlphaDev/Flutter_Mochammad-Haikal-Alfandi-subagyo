import 'package:app_section_26/model/api/contacts_api.dart';
import 'package:app_section_26/model/contacts_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial()) {
    final service = ContactsApi();
    final List<ContactsModel> contacts = [];
    final List<ContactsModel> fetchContacts = [];
    final List<ContactsModel> putContacts = [];

    on<ContactEventPost>((event, emit) async {
      emit(ContactStateLoading());
      try {
        final Response response = await service.postDataContact(
          name: event.name,
          phone: event.phone,
        );

        ContactsModel contactsModel = ContactsModel.fromJson(response.data);

        contacts.add(contactsModel);

        emit(ContactStateSuccess(contacts));
      } catch (e) {
        emit(ContactStateError(e.toString()));
      }
    });

    on<ContactEventConvertJson>(
      (event, emit) async {
        emit(ContactStateLoading());
        try {
          final Response response = await service.fetchContact();

          ContactsModel contactModel = ContactsModel.fromJson(response.data);

          fetchContacts.clear();
          fetchContacts.add(contactModel);

          emit(ContactStateSuccess(fetchContacts));
        } catch (e) {
          emit(ContactStateError(e.toString()));
        }
      },
    );

    on<ContactEventPut>((event, emit) async {
      emit(ContactStateLoading());
      try {
        await service.putDataContacts(
          title: event.title,
          body: event.body,
        );

        emit(ContactStateSuccess(putContacts));
      } catch (e) {
        emit(ContactStateError(e.toString()));
      }
    });
  }
}
