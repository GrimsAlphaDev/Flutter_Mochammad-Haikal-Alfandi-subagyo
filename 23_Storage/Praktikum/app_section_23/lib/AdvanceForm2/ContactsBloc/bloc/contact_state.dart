part of 'contact_bloc.dart';

@immutable
abstract class ContactState {}

class ContactInitial extends ContactState {}

class AddContactState extends ContactState {}

class RemoveContactState extends ContactState {}

class GetContactState extends ContactState {}

class UpdateContactState extends ContactState {}
