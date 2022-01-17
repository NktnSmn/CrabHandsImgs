import 'package:crab_hands_imgs/base/data/local/image_table.dart';
import 'package:drift/drift.dart';

part 'database.g.dart';

@DriftDatabase(tables: [ImageTable])
class Database extends _$Database {
  @override
  int get schemaVersion => 1;

  Future<List<ImageLocal>> get allImages => select(imageTable).get();

  Database(QueryExecutor queryExecutor) : super(queryExecutor);
}
