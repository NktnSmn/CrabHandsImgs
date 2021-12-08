import 'profile_links.dart';
import 'user_links.dart';

class User {
  User({
    required this.id,
    required this.username,
    required this.name,
    required this.portfolioUrl,
    required this.bio,
    required this.location,
    required this.totalLikes,
    required this.totalPhotos,
    required this.totalCollections,
    required this.instagramUsername,
    required this.twitterUsername,
    required this.profileImage,
    required this.links,
  });

  String id;
  String username;
  String name;
  String portfolioUrl;
  String bio;
  String location;
  int totalLikes;
  int totalPhotos;
  int totalCollections;
  String instagramUsername;
  String twitterUsername;
  ProfileImage profileImage;
  UserLinks links;
}
