//part 'image_list_event.freezed.dart';

import 'package:crab_hands_imgs/list/domain/models/image/image.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_list_event.freezed.dart';

abstract class ImageListEvent {}

@freezed
class RequestPage extends ImageListEvent with _$RequestPage {
  const factory RequestPage({required int pageNumber}) = _RequestPage;
}

class OnImageItemClick extends ImageListEvent {
  final Image image;

  OnImageItemClick(this.image);
}
