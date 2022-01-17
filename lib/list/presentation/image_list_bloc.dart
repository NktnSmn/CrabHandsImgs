import 'package:crab_hands_imgs/list/domain/img_list_repository.dart';
import 'package:crab_hands_imgs/list/domain/models/image/image.dart';
import 'package:crab_hands_imgs/list/presentation/image_list_event.dart';
import 'package:crab_hands_imgs/list/presentation/image_list_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ImageListBloc extends Bloc<ImageListEvent, ImageListState> {
  final ImgListRepository _repository;

  ImageListBloc(this._repository)
      : super(ImageListState(
            // ignore: prefer-trailing-comma
            pagingController: PagingController<int, Image>(firstPageKey: 1))) {
    state.pagingController.addPageRequestListener((pageKey) {
      add(RequestPage(pageNumber: pageKey));
    });
    on<ImageListEvent>((event, emit) async {
      if (event is RequestPage) {
        final List<Image> images =
            await _repository.fetchImages(event.pageNumber);
        state.pagingController.appendPage(images, event.pageNumber + 1);
      }
    });
  }

  @override
  @mustCallSuper
  Future<void> close() async {
    state.pagingController.dispose();
    return super.close();
  }
}
