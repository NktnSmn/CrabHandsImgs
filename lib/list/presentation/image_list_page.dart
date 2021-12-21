import 'package:cached_network_image/cached_network_image.dart';
import 'package:crub_hands_imgs/generated/l10n.dart';
import 'package:crub_hands_imgs/list/domain/models/image/image.dart' as domain;
import 'package:crub_hands_imgs/list/presentation/image_list_event.dart';
import 'package:crub_hands_imgs/list/presentation/image_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:koin_flutter/src/widget_extension.dart';

class ImageListPage extends StatefulWidget {
  static List<GoRoute> get routes => <GoRoute>[
        GoRoute(path: '/', builder: (context, state) => const ImageListPage()),
      ];

  const ImageListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ImageListPageState();
}

class ImageListPageState extends State<ImageListPage> with ScopeStateMixin {
  @override
  Widget build(BuildContext context) => BlocBuilder<Bloc<ImageListEvent, ImageListState>, ImageListState>(
        bloc: currentScope.get<Bloc<ImageListEvent, ImageListState>>(),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text(Strings.of(context).imageListPageTitle)),
            body: _getBody(context, state),
          );
        },
      );

  Widget _getBody(BuildContext context, ImageListState state) {
    if (state is LoadingState) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is ContentState) {
      return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: state.images.length,
        // ignore: avoid-returning-widgets
        itemBuilder: (context, position) => _getItem(context, state.images, position),
        physics: const ClampingScrollPhysics(),
      );
    } else {
      throw Exception();
    }
  }

  Widget _getItem(BuildContext context, List<domain.Image> images, int position) =>
      CachedNetworkImage(imageUrl: images[position].regularUrl);
}
