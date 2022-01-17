import 'package:crab_hands_imgs/list/domain/models/image/image.dart';

abstract class ImgListRepository {
  Future<List<Image>> fetchImages(int pageNumber);

  Future<void> saveImages(List<Image> images);
}
