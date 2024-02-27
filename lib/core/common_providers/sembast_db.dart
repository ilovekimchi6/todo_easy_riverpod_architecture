import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

part 'sembast_db.g.dart';

//Sembast Database is created using a future provider

@Riverpod(keepAlive: true)
Future<Database> sembastDatabase(SembastDatabaseRef ref) async {
  var dir = await getApplicationDocumentsDirectory();
  await dir.create(recursive: true);
  var dbPath = join(dir.path, 'todo.db');
  var db = await databaseFactoryIo.openDatabase(dbPath);
  return db;
}
