part of 'contacts_bloc.dart';

@immutable
abstract class ContactsState {}

class ContactsInitial extends ContactsState {}

class ContactsStateLoading extends ContactsState {}

class ContactsStateSuccess extends ContactsState {
  final List<Map<String, dynamic>> contacts;

  ContactsStateSuccess(this.contacts);
}

class ContactsStateError extends ContactsState {
  final String message;

  ContactsStateError(this.message);
}
