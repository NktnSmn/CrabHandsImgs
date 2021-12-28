import 'package:crab_hands_imgs/base/data/local/database.dart';
import 'package:crab_hands_imgs/list/data/img_list_repository_impl.dart';
import 'package:crab_hands_imgs/list/domain/img_list_repository.dart';
import 'package:crab_hands_imgs/list/presentation/image_list_bloc.dart';
import 'package:crab_hands_imgs/list/presentation/image_list_event.dart';
import 'package:crab_hands_imgs/list/presentation/image_list_page.dart';
import 'package:crab_hands_imgs/list/presentation/image_list_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koin/koin.dart';

extension ListDI on Module {
  void addListDI() {
    scope<ImageListPage>((dsl) => dsl
      ..scoped<ImgListRepository>((scope) => ImgListRepositoryImpl(scope.get<Database>(), scope.get<Dio>()))
      ..scoped<Bloc<ImageListEvent, ImageListState>>((scope) => ImageListBloc(scope.get<ImgListRepository>())));
  }
}
