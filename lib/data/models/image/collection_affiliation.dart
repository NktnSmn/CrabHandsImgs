class CollectionAffiliation {
  CollectionAffiliation({
    required this.id,
    required this.title,
    required this.publishedAt,
    required this.lastCollectedAt,
    required this.updatedAt,
  });

  int id;
  String title;
  DateTime publishedAt;
  DateTime lastCollectedAt;
  DateTime updatedAt;
}