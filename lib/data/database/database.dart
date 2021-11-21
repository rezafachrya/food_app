import 'dart:io';

// import 'package:moor/moor.dart';
// import 'package:moor/ffi.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as paths;
import 'package:food/data/database/database_manager.dart';
// import 'package:moor_flutter/moor_flutter.dart';

AppDatabase openConnection({bool logStatements = false}) {
  if (Platform.isIOS || Platform.isAndroid) {
    final executor = LazyDatabase(() async {
      // put the database file, called db.sqlite here, into the documents folder
      // for your app.
      final dbFolder = await paths.getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase(file, logStatements: true);
    });
    return AppDatabase(executor);
  }
  if (Platform.isMacOS || Platform.isLinux) {
    final file = File('db.sqlite');
    return AppDatabase(NativeDatabase(file, logStatements: logStatements));
  }
  return AppDatabase(NativeDatabase.memory(logStatements: logStatements));
}
