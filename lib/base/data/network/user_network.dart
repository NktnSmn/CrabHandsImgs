import 'package:crab_hands_imgs/base/data/network/profile_image_network.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_network.freezed.dart';

part 'user_network.g.dart';

@freezed
class UserNetwork with _$UserNetwork {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory UserNetwork(
    String id,
    String username,
    String name,
    ProfileImageNetwork profileImage,
  ) = _UserNetwork;

  factory UserNetwork.fromJson(Map<String, dynamic> json) => _$UserNetworkFromJson(json);
}
