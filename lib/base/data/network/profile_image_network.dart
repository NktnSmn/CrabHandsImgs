import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_image_network.freezed.dart';

part 'profile_image_network.g.dart';

@freezed
class ProfileImageNetwork with _$ProfileImageNetwork {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory ProfileImageNetwork(
    String small,
    String medium,
    String large,
  ) = _ProfileImageNetwork;

  factory ProfileImageNetwork.fromJson(Map<String, dynamic> json) => _$ProfileImageNetworkFromJson(json);
}
