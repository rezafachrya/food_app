import 'package:drift/drift.dart';

class Users extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();
  TextColumn get username => text()();
  TextColumn get mail => text()();
}
