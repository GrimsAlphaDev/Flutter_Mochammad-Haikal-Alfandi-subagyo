part of 'contact_bloc.dart';

@immutable
abstract class ContactEvent {}

class ContactEventPost extends ContactEvent {
  final String name;
  final String phone;

  ContactEventPost({required this.name, required this.phone});
}

class ContactEventConvertJson extends ContactEvent {}

class ContactEventPut extends ContactEvent {
  final String title;
  final String body;

  ContactEventPut({required this.title, required this.body});
}
