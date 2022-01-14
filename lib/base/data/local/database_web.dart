import 'package:crab_hands_imgs/base/data/local/database.dart';
import 'package:drift/web.dart';

Database constructDb() => Database(WebDatabase('crab_hands_imgs'));
