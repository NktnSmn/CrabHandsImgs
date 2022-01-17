import 'package:crab_hands_imgs/generated/l10n.dart';
import 'package:crab_hands_imgs/list/domain/models/image/image.dart' as domain;
import 'package:crab_hands_imgs/list/presentation/image_list_event.dart';
import 'package:crab_hands_imgs/list/presentation/image_list_state.dart';
import 'package:crab_hands_imgs/list/presentation/item_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:koin_flutter/src/widget_extension.dart'; //ignore: implementation_imports

//ignore_for_file: avoid_print
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
          body: Container(
            alignment: Alignment.center,
            child: SizedBox(
              width: kIsWeb
                  ? 1024
                  : _isTablet()
                      ? screenSize.width / 2
                      : double.infinity,
              child: PagedListView.separated(
                pagingController: _bloc.state.pagingController,
                builderDelegate: PagedChildBuilderDelegate<domain.Image>(itemBuilder: createItemBuilder(screenSize)),
                separatorBuilder: (context, index) => const SizedBox(width: double.infinity, height: 16),
                addAutomaticKeepAlives: false,
                physics: const ClampingScrollPhysics(),
                cacheExtent: screenSize.height * 2,
              ),
            ),
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

  bool _isTablet() {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }
}
