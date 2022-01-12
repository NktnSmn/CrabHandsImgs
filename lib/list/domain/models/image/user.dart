import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  factory User(
    String id,
    String username,
    String name,
    String smallProfileImageUrl,
    String mediumProfileImageUrl,
    String largeProfileImageUrl,
  ) = _User;
}
