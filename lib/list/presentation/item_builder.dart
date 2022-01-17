import 'dart:math';

import 'package:crab_hands_imgs/list/domain/models/image/image.dart' as domain;
import 'package:crab_hands_imgs/list/presentation/widget/author_photo.dart';
import 'package:crab_hands_imgs/list/presentation/widget/end_slide_action_pane.dart';
import 'package:crab_hands_imgs/list/presentation/widget/image_item_content.dart';
import 'package:crab_hands_imgs/list/presentation/widget/start_slide_action_pane.dart';
import 'package:crab_hands_imgs/list/presentation/widget/video_item_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

ItemWidgetBuilder<domain.Image> createItemBuilder(Size screenSize) {
  final double itemHeight = screenSize.height / 3;
  final List<String> gifsUrls = [
    'https://i.gifer.com/By.gif',
    'https://cdnb.artstation.com/p/assets/images/images/017/172/739/original/alexander-rybalchenko-mk85.gif?1554914980',
    'https://i.gifer.com/XOsX.gif',
    'https://i.gifer.com/2GU.gif',
    'https://i.gifer.com/Be.gif',
    'https://i.gifer.com/4vo.gif',
    'https://i.gifer.com/PEsm.gif',
  ];
  final List<String> videosUrls = [
    'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_1920_18MG.mp4',
    'https://www.appsloveworld.com/wp-content/uploads/2018/10/640.mp4',
  ];
  return (context, item, index) => Column(
        children: [
          Slidable(
            startActionPane: StartSlideActionPane(),
            endActionPane: EndSlideActionPane(),
            child: index % 3 == 0
                ? ImageItemContent(url: gifsUrls[Random().nextInt(gifsUrls.length)], height: itemHeight)
                : index % 5 == 0
                    ? VideoItemContent(url: videosUrls[Random().nextInt(videosUrls.length)], height: itemHeight)
                    : ImageItemContent(url: item.regularUrl, height: itemHeight),
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
                AuthorPhoto(item: item),
              ],
            ),
          ),
        ],
      );
}
