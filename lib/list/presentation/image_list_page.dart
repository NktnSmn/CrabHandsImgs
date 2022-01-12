//ignore_for_file: avoid_print

import 'package:crab_hands_imgs/generated/assets.gen.dart';
import 'package:crab_hands_imgs/generated/l10n.dart';
import 'package:crab_hands_imgs/list/domain/models/image/image.dart' as domain;
import 'package:crab_hands_imgs/list/presentation/image_list_event.dart';
import 'package:crab_hands_imgs/list/presentation/image_list_state.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:koin_flutter/src/widget_extension.dart'; //ignore: implementation_imports

class ImageListPage extends StatefulWidget {
  static List<GoRoute> get routes => <GoRoute>[
        GoRoute(path: '/', builder: (context, state) => const ImageListPage()),
      ];

  const ImageListPage({Key? key}) : super(key: key);

  @override
  //ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    print('Page createState');
    return ImageListPageState();
  }

  @override
  StatefulElement createElement() {
    print('Page createElement');
    return StatefulElement(this);
  }
}

class LogStatefulElement extends StatefulElement {
  LogStatefulElement(StatefulWidget widget) : super(widget);

  @override
  Widget build() {
    print('Page element build');
    return super.build();
  }
}

class ImageListPageState extends State<ImageListPage> with ScopeStateMixin {
  late final Bloc<ImageListEvent, ImageListState> _bloc = currentScope.get<Bloc<ImageListEvent, ImageListState>>();

  @override
  void didChangeDependencies() {
    print('Page state didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant ImageListPage oldWidget) {
    print('Page state didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('Page state deactivate');
    super.deactivate();
  }

  @override
  void activate() {
    print('Page state activate');
    super.activate();
  }

  @override
  void initState() {
    print('Page state initState');
    try {
      FlutterDisplayMode.active.then<void>((value) {
        print('Active DM $value');
      });
      FlutterDisplayMode.preferred.then<void>((value) {
        print('Preferred DM $value');
      });
      FlutterDisplayMode.supported.then(
        (value) {
          for (final element in value) {
            print('Supported DM $element');
          }
          FlutterDisplayMode.setPreferredMode(value[2]).then((value) {
            FlutterDisplayMode.preferred.then<void>((value) {
              print('Preferred DM $value');
            });
            FlutterDisplayMode.active.then<void>((value) {
              print('Active DM $value');
            });
          });
        },
      );
    } on PlatformException catch (e) {
      Fluttertoast.showToast(msg: 'Init state extension - $e');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Page state build');
    final Size screenSize = MediaQuery.of(context).size;
    return BlocBuilder<Bloc<ImageListEvent, ImageListState>, ImageListState>(
      bloc: _bloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(Strings.of(context).imageListPageTitle)),
          body: PagedListView.separated(
            pagingController: _bloc.state.pagingController,
            builderDelegate: PagedChildBuilderDelegate<domain.Image>(itemBuilder: _createItemBuilder(screenSize)),
            separatorBuilder: (context, index) => const SizedBox(width: double.infinity, height: 16),
            addAutomaticKeepAlives: false,
            physics: const ClampingScrollPhysics(),
            cacheExtent: screenSize.height * 2,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  ItemWidgetBuilder<domain.Image> _createItemBuilder(Size screenSize) {
    final double imageHeight = screenSize.height / 3;
    return (context, item, index) => Column(
          children: [
            Slidable(
              startActionPane: _createStartSlideActionPane(), //ignore: avoid-returning-widgets
              endActionPane: _createEndSlideActionPane(), //ignore: avoid-returning-widgets
              child: _createImage(item, screenSize, imageHeight), //ignore: avoid-returning-widgets
            ),
            Container(
              padding: const EdgeInsets.only(top: 4, left: 6, right: 6),
              child: Row(
                children: [
                  const Icon(Icons.favorite_border, size: 24, color: Color(0x8FFF0000)),
                  const SizedBox(width: 2),
                  Text(item.likes.toString()),
                  const Spacer(),
                  Text(item.user.name),
                  const SizedBox(width: 4),
                  _createAuthorPhoto(item), //ignore: avoid-returning-widgets
                ],
              ),
            ),
          ],
        );
  }

  ActionPane _createStartSlideActionPane() => ActionPane(
        dragDismissible: false,
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.download,
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.bookmark_border,
          ),
        ],
      );

  ActionPane _createEndSlideActionPane() => ActionPane(
        dragDismissible: false,
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.open_in_browser,
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0xFF0392CF),
            foregroundColor: Colors.white,
            icon: Icons.share,
          ),
        ],
      );

  ExtendedImage _createImage(domain.Image item, Size screenSize, double imageHeight) => ExtendedImage.network(
        item.regularUrl,
        width: double.infinity,
        height: imageHeight,
        //cacheHeight: imageHeight.toInt(),
        fit: BoxFit.cover,
        enableLoadState: false,
        loadStateChanged: (state) {
          switch (state.extendedImageLoadState) {
            case LoadState.loading:
              //return SizedBox(
              //  width: screenSize.width,
              //  height: screenSize.width * (item.height / item.width),
              //  child: BlurHash(hash: item.blurHash),
              //);
              return Assets.images.icImage.image(
                fit: BoxFit.none,
                width: screenSize.width,
                height: screenSize.width * (item.height / item.width),
              );
            default:
              return null;
          }
        },
      );

  ExtendedImage _createAuthorPhoto(domain.Image item) => ExtendedImage.network(
        item.user.mediumProfileImageUrl,
        width: 34,
        height: 34,
        shape: BoxShape.circle,
        enableLoadState: false,
        loadStateChanged: (state) {
          if (state.extendedImageLoadState == LoadState.loading) {
            return Assets.images.icImage.image(
              fit: BoxFit.cover,
              width: 34,
              height: 34,
            );
          } else {
            return null;
          }
        },
      );
}
