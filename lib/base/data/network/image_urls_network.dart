import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_urls_network.freezed.dart';

part 'image_urls_network.g.dart';

@freezed
class ImageUrlsNetwork with _$ImageUrlsNetwork {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory ImageUrlsNetwork(
    String raw,
    String full,
    String regular,
    String small,
    String thumb,
  ) = _ImageUrlsNetwork;

  factory ImageUrlsNetwork.fromJson(Map<String, dynamic> json) => _$ImageUrlsNetworkFromJson(json);
}
