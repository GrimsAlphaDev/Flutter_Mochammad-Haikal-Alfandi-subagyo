part of 'contact_bloc.dart';

@immutable
abstract class ContactState {}

class ContactInitial extends ContactState {}

class ContactStateLoading extends ContactState {}

class ContactStateSuccess extends ContactState {
  final List<ContactsModel> contacts;

  ContactStateSuccess(this.contacts);
}

class ContactStateError extends ContactState {
  final String message;

  ContactStateError(this.message);
}
