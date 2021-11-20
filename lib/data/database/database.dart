import 'dart:io';

import 'package:moor/moor.dart';
import 'package:moor/ffi.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as paths;
import 'package:food/data/database/database_manager.dart';
import 'package:moor_flutter/moor_flutter.dart';

AppDatabase openConnection({bool logStatements = true}) {
  // if (Platform.isIOS || Platform.isAndroid) {
  final executor = LazyDatabase(() async {
    final dataDir = await paths.getApplicationDocumentsDirectory();
    final dbFile = File(p.join(dataDir.path, 'db.sqlite'));
    return VmDatabase(dbFile, logStatements: logStatements);
  });
  return AppDatabase(executor);
  // }
  // if (Platform.isMacOS || Platform.isLinux) {
  //   final file = File('db.sqlite');
  //   return AppDatabase(VmDatabase(file, logStatements: logStatements));
  // }
  // return AppDatabase(VmDatabase.memory(logStatements: logStatements));
}
