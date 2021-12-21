import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.freezed.dart';

@freezed
class Image with _$Image {
  factory Image(
    String id,
    int width,
    int height,
    String color,
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
    DateTime createdAt,
    DateTime updatedAt,
  ) = _Image;
}
