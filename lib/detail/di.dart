import 'package:crub_hands_imgs/detail/presentation/image_bloc.dart';
import 'package:crub_hands_imgs/detail/presentation/image_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koin/koin.dart';

extension DetailsDI on Module {
  void addDetailsDI() {
    scope<ImagePage>((dsl) => dsl..scoped<Bloc<ImageEvent, ImageState>>((scope) => ImageBloc()));
  }
}
