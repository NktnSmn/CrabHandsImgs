import 'package:crab_hands_imgs/generated/assets.gen.dart';
import 'package:crab_hands_imgs/list/domain/models/image/image.dart' as domain;
import 'package:extended_image/extended_image.dart';
import 'package:flutter/widgets.dart';

class AuthorPhoto extends ExtendedImage {
  AuthorPhoto({required domain.Image item, Key? key})
      : super.network(
          item.user.mediumProfileImageUrl,
          key: key,
          width: 34,
          height: 34,
          shape: BoxShape.circle,
          enableLoadState: false,
          loadStateChanged: (state) {
            return state.extendedImageLoadState == LoadState.loading
                ? Assets.images.icImage.image(fit: BoxFit.cover, width: 34, height: 34)
                : null;
          },
        );
}
