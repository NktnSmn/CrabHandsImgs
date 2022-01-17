import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ImagePage extends StatelessWidget {
  final String _id; // ignore: unused_field

  static List<GoRoute> get routes => <GoRoute>[
        GoRoute(
          path: '/image/:id',
          builder: (context, state) => ImagePage(state.params['id']!), //TODO Если id null, то отправить на Stub экран
        ),
      ];

  const ImagePage(this._id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
