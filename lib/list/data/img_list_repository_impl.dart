import 'package:crub_hands_imgs/base/data/local/database.dart';
import 'package:crub_hands_imgs/base/data/network/image_network.dart';
import 'package:crub_hands_imgs/list/domain/img_list_repository.dart';
import 'package:crub_hands_imgs/list/domain/models/image/image.dart';
import 'package:dio/dio.dart';

typedef RawJSON = Map<String, dynamic>;
typedef RawJSONList = List<RawJSON>;

class ImgListRepositoryImpl implements ImgListRepository {
  final Database _database;
  final Dio _dio;

  ImgListRepositoryImpl(this._database, this._dio);

  @override
  Future<List<Image>> fetchImages() async {
    try {
      final Response<dynamic> response =
          await _dio.get<dynamic>('/photos', queryParameters: <String, dynamic>{'per_page': 100});
      if (response.data is List) {
        final List<dynamic> listData = response.data as List<dynamic>;
        return listData
            .whereType<Map<String, dynamic>>()
            .map(ImageNetwork.fromJson)
            .map((element) => Image(
                  element.id,
                  element.width,
                  element.height,
                  element.color,
                  element.urls.raw,
                  element.urls.full,
                  element.urls.regular,
                  element.urls.small,
                  element.urls.thumb,
                  element.links.self,
                  element.links.html,
                  element.links.download,
                  element.links.downloadLocation,
                  element.description,
                  element.likes,
                  element.likedByUser,
                  element.createdAt,
                  element.updatedAt,
                ))
            .toList();
      } else {
        return List<Image>.empty();
      }
    } on Exception {
      return List<Image>.empty();
    }
  }

  @override
  Future<void> saveImages(List<Image> images) {
    throw UnimplementedError();
  }
}
