import 'package:crub_hands_imgs/list/domain/img_list_repository.dart';
import 'package:crub_hands_imgs/list/domain/models/image/image.dart';
import 'package:crub_hands_imgs/list/presentation/image_list_event.dart';
import 'package:crub_hands_imgs/list/presentation/image_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageListBloc extends Bloc<ImageListEvent, ImageListState> {
  final ImgListRepository _repository;

  ImageListBloc(this._repository) : super(LoadingState()) {
    on<ImageListEvent>((event, emit) async {
      if (event is Loading) {
        final List<Image> images = await _repository.fetchImages();
        emit.call(ContentState(images));
      }
    });
    add(Loading());
  }
}
