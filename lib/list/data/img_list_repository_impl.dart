import 'package:crab_hands_imgs/base/data/local/database.dart';
import 'package:crab_hands_imgs/base/data/network/image_network.dart';
import 'package:crab_hands_imgs/list/domain/img_list_repository.dart';
import 'package:crab_hands_imgs/list/domain/models/image/image.dart';
import 'package:crab_hands_imgs/list/domain/models/image/user.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

typedef RawJSON = Map<String, dynamic>;
typedef RawJSONList = List<RawJSON>;

class ImgListRepositoryImpl implements ImgListRepository {
  final Database _database;
  final Dio _dio;

  ImgListRepositoryImpl(this._database, this._dio);

  @override
  Future<List<Image>> fetchImages(int pageNumber) async {
    try {
      final Response<dynamic> response =
          await _dio.get<dynamic>('/photos', queryParameters: <String, dynamic>{'page': pageNumber, 'per_page': 20});
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
                  element.blurHash,
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
                  User(
                    element.user.id,
                    element.user.username,
                    element.user.name,
                    element.user.profileImage.small,
                    element.user.profileImage.medium,
                    element.user.profileImage.large,
                  ),
                  element.createdAt,
                  element.updatedAt,
                ))
            .toList();
      } else {
        // ignore: unawaited_futures
        Fluttertoast.showToast(msg: 'Load imgs extension - result is not List');
        return List<Image>.empty();
      }
    } on Exception catch (e) {
      // ignore: unawaited_futures
      Fluttertoast.showToast(msg: 'Load imgs extension - $e');
      return List<Image>.empty();
    }
  }

  @override
  Future<void> saveImages(List<Image> images) {
    throw UnimplementedError();
  }
}
