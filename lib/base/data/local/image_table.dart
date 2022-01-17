import 'package:drift/drift.dart';

@DataClassName('ImageLocal')
class ImageTable extends Table {
  TextColumn get id => text()();

  IntColumn get width => integer()();

  IntColumn get height => integer()();

  TextColumn get color => text()();

  TextColumn get description => text()();

  TextColumn get rawUrl => text()();

  TextColumn get fullUrl => text()();

  TextColumn get regularUrl => text()();

  TextColumn get smallUrl => text()();

  TextColumn get thumbUrl => text()();

  TextColumn get selfLink => text()();

  TextColumn get htmlLink => text()();

  TextColumn get downloadLink => text()();

  TextColumn get downloadLocationLink => text()();

  IntColumn get likes => integer()();

  BoolColumn get likedByUser => boolean()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<dynamic>> get primaryKey => <Column<dynamic>>{id};
}
