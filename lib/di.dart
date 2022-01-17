import 'package:crab_hands_imgs/base/data/local/database.dart';
import 'package:crab_hands_imgs/base/data/local/database_shared.dart';
import 'package:crab_hands_imgs/base/data/network/dio/dio_config.dart';
import 'package:crab_hands_imgs/detail/di.dart';
import 'package:crab_hands_imgs/list/di.dart';
import 'package:dio/dio.dart';
import 'package:koin/koin.dart';

Module createDIModule() => Module()
  ..single<Database>((scope) => constructDb())
  ..single<Dio>((scope) {
    final Dio dio = Dio();
    configureDio(dio);
    return dio;
  })
  ..addListDI()
  ..addDetailsDI();
