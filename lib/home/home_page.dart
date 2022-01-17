import 'package:crab_hands_imgs/generated/l10n.dart';
import 'package:crab_hands_imgs/list/presentation/image_list_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  static List<GoRoute> get routes => <GoRoute>[
        GoRoute(path: '/', builder: (context, state) => const HomePage()),
      ];

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(Strings.of(context).imageListPageTitle)),
        body: Container(
          alignment: Alignment.center,
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              OutlinedButton(
                onPressed: () {
                  GoRouter.of(context).push(ImageListPage.routePath);
                },
                child: const Text('List'),
              ),
              //TODO Сюда добавлять новые элементы
            ],
          ),
        ),
      );
}
