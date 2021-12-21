import 'package:crub_hands_imgs/app.dart';
import 'package:crub_hands_imgs/di.dart';
import 'package:flutter/material.dart';
import 'package:koin/koin.dart';

void main() {
  startKoin((app) => app.modules(<Module>[createDIModule()]));
  runApp(CrabHandsImgsApp());
}
