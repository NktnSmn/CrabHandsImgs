import 'package:crab_hands_imgs/list/domain/models/image/image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_list_state.freezed.dart';

abstract class ImageListState {}

class LoadingState extends ImageListState {}

@freezed
class ContentState extends ImageListState with _$ContentState {
  factory ContentState(List<Image> images) = _ContentState;
}
