import 'package:crab_hands_imgs/generated/assets.gen.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/widgets.dart';

class ImageItemContent extends ExtendedImage {
  ImageItemContent({required String url, required double height, Key? key})
      : super.network(
          url,
          key: key,
          width: double.infinity,
          height: height,
          cacheHeight: height.toInt(),
          cacheRawData: true,
          fit: BoxFit.cover,
          enableLoadState: false,
          loadStateChanged: (state) {
            switch (state.extendedImageLoadState) {
              case LoadState.loading:
                return Assets.images.icImage.image(
                  fit: BoxFit.none,
                  width: 200,
                );
              default:
                return null;
            }
          },
        );
}
