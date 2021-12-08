import '../user/user.dart';
import 'collection_affiliation.dart';
import 'image_links.dart';
import 'image_urls.dart';

class Image {
  Image({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    required this.likes,
    required this.likedByUser,
    required this.description,
    required this.user,
    required this.collectionsAffiliations,
    required this.urls,
    required this.links,
  });

  String id;
  int width;
  int height;
  String color;
  String blurHash;
  ImageUrls urls;
  ImageLinks links;
  String description;
  int likes;
  bool likedByUser;
  User user;
  List<CollectionAffiliation> collectionsAffiliations;
  DateTime createdAt;
  DateTime updatedAt;
}
