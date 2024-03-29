import 'package:crab_hands_imgs/base/data/network/image_links_network.dart';
import 'package:crab_hands_imgs/base/data/network/image_urls_network.dart';
import 'package:crab_hands_imgs/base/data/network/user_network.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_network.freezed.dart';

part 'image_network.g.dart';

@freezed
class ImageNetwork with _$ImageNetwork {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory ImageNetwork(
    String id,
    int width,
    int height,
    String color,
    String blurHash,
    ImageUrlsNetwork urls,
    ImageLinksNetwork links,
    String? description,
    int likes,
    bool likedByUser, //ignore: avoid_positional_boolean_parameters
    UserNetwork user,
    DateTime createdAt,
    DateTime updatedAt,
  ) = _ImageNetwork;

  factory ImageNetwork.fromJson(Map<String, dynamic> json) => _$ImageNetworkFromJson(json);
}
