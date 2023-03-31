part of 'contacts_bloc.dart';

@immutable
abstract class ContactsEvent {}

class ContactsEventAdd extends ContactsEvent {
  final String name;
  final String nomor;
  final dynamic tanggal;
  final dynamic color;
  final dynamic context;
  final dynamic file;

  ContactsEventAdd(
      {required this.name,
      required this.nomor,
      required this.tanggal,
      required this.color,
      required this.context,
      required this.file});
}

class ContactsEventDelete extends ContactsEvent {
  final int id;

  ContactsEventDelete({required this.id});
}

class ContactEventEdit extends ContactsEvent {
  final int id;
  final String name;
  final String nomor;
  final dynamic tanggal;
  final dynamic color;
  final dynamic file;

  ContactEventEdit(
      {required this.id,
      required this.name,
      required this.nomor,
      required this.tanggal,
      required this.color,
      required this.file});
}
