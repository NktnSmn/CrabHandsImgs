import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_links_network.freezed.dart';

part 'image_links_network.g.dart';

@freezed
class ImageLinksNetwork with _$ImageLinksNetwork {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory ImageLinksNetwork(
    String self,
    String html,
    String download,
    String downloadLocation,
  ) = _ImageLinksNetwork;

  factory ImageLinksNetwork.fromJson(Map<String, dynamic> json) => _$ImageLinksNetworkFromJson(json);
}
