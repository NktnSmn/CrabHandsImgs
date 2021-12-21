//part 'image_list_event.freezed.dart';

import 'package:crub_hands_imgs/list/domain/models/image/image.dart';

abstract class ImageListEvent {}

class Loading extends ImageListEvent {}

class OnImageItemClick extends ImageListEvent {
  final Image image;

  OnImageItemClick(this.image);
}
