import 'package:crab_hands_imgs/list/domain/models/image/image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

part 'image_list_state.freezed.dart';

@freezed
class ImageListState with _$ImageListState {
  factory ImageListState({
    required PagingController<int, Image> pagingController,
  }) = _ImageListState;
}
