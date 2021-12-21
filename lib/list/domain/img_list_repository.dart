import 'package:crub_hands_imgs/list/domain/models/image/image.dart';

abstract class ImgListRepository {
  Future<List<Image>> fetchImages();

  Future<void> saveImages(List<Image> images);
}
