// ignore_for_file: avoid_print

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoItemContent extends StatefulWidget {
  final String url;
  final double height;

  const VideoItemContent({
    required this.url,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  //ignore: no_logic_in_create_state
  _VideoItemsState createState() {
    print('VideoItem widget $hashCode createState');
    return _VideoItemsState();
  }

  @override
  StatefulElement createElement() {
    print('VideoItem widget $hashCode createElement');
    return super.createElement();
  }
}

//TODO Нужна пауза при укатывании с экрана, см. https://pub.dev/packages/inview_notifier_list
class _VideoItemsState extends State<VideoItemContent> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    print('VideoItem $hashCode initState [${widget.hashCode}, ${widget.url}]');
    _videoPlayerController = VideoPlayerController.network(widget.url);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoInitialize: true,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void didUpdateWidget(covariant VideoItemContent oldWidget) {
    print(
      'VideoItem $hashCode didUpdateWidget [${widget.hashCode}, ${widget.url}], old [${oldWidget.hashCode}, ${oldWidget.url}]',
    );
    _videoPlayerController.dispose();
    _chewieController.dispose();
    _videoPlayerController = VideoPlayerController.network(widget.url);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoInitialize: true,
      autoPlay: true,
      looping: true,
    );
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    print('VideoItem $hashCode didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void activate() {
    print('VideoItem $hashCode activate');
    super.activate();
  }

  @override
  void deactivate() {
    print('VideoItem $hashCode deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('VideoItem $hashCode dispose');
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('VideoItem $hashCode build');
    return SizedBox(
      width: double.infinity,
      height: widget.height,
      child: Chewie(controller: _chewieController),
    );
  }
}
