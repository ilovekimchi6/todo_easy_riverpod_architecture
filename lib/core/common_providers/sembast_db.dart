import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast_memory.dart';

part 'sembast_db.g.dart';

/// Sembast Database is created using a `future provider`.
@Riverpod(keepAlive: true)
Future<Database> sembastDatabase(SembastDatabaseRef ref) async {
  return databaseFactoryMemoryFs.openDatabase('todo.db');
}
