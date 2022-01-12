import 'package:crab_hands_imgs/list/domain/models/image/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.freezed.dart';

@freezed
class Image with _$Image {
  factory Image(
    String id,
    int width,
    int height,
    String color,
    String blurHash,
    String rawUrl,
    String fullUrl,
    String regularUrl,
    String smallUrl,
    String thumbUrl,
    String selfLink,
    String htmlLink,
    String downloadLink,
    String downloadLocationLink,
    String? description,
    int likes,
    bool likedByUser,
    User user,
    DateTime createdAt,
    DateTime updatedAt,
  ) = _Image;
}
