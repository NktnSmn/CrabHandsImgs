import 'dart:io';

import 'package:crab_hands_imgs/base/data/local/database.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

Database constructDb() => Database(LazyDatabase(() async {
      final Directory dbFolder = await getApplicationDocumentsDirectory();
      final File file = File(path.join(dbFolder.path, 'crab_hands_imgs.sqlite'));
      return NativeDatabase(file);
    }));
