import 'dart:io';

import 'package:crub_hands_imgs/base/data/local/image_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DriftDatabase(tables: [ImageTable])
class Database extends _$Database {
  @override
  int get schemaVersion => 1;

  Future<List<ImageLocal>> get allImages => select(imageTable).get();

  Database() : super(_openConnection());
}

LazyDatabase _openConnection() => LazyDatabase(() async {
      final Directory dbFolder = await getApplicationDocumentsDirectory();
      final File file = File(path.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase(file);
    });
