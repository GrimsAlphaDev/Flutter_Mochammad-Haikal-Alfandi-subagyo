part of 'database_bloc.dart';

@immutable
abstract class DatabaseState {}

class DatabaseInitial extends DatabaseState {}

class LoadDatabaseState extends DatabaseState {}
