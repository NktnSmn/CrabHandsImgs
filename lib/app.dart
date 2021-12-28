import 'package:crab_hands_imgs/detail/presentation/image_page.dart';
import 'package:crab_hands_imgs/generated/l10n.dart';
import 'package:crab_hands_imgs/list/presentation/image_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

class CrabHandsImgsApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      ...ImageListPage.routes,
      ...ImagePage.routes,
    ],
  );

  CrabHandsImgsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int _primaryColor = 0xFF2B4570;
    const int _accentColor = 0xFFE83151;
    PaintingBinding.instance?.imageCache?.maximumSizeBytes = 1000 << 20;
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        Strings.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Strings.delegate.supportedLocales,
      theme: ThemeData(
        canvasColor: const Color(0xFFF7FAFC),
        primarySwatch: const MaterialColor(
          _primaryColor,
          <int, Color>{
            50: Color(0xFFE6E9EE),
            100: Color(0xFFBFC7D4),
            200: Color(0xFF95A2B8),
            300: Color(0xFF6B7D9B),
            400: Color(0xFF4B6185),
            500: Color(_primaryColor),
            600: Color(0xFF263E68),
            700: Color(0xFF20365D),
            800: Color(0xFF1A2E53),
            900: Color(0xFF101F41),
          },
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(primary: const Color(_accentColor)),
        ),
        textTheme: const TextTheme(
          headline3: TextStyle(color: Color(0xFF333333), fontSize: 20, fontWeight: FontWeight.w300),
          headline4: TextStyle(color: Color(_accentColor), fontSize: 20, fontWeight: FontWeight.w300),
          headline6: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
          bodyText1: TextStyle(color: Color(0xFF727272), fontSize: 16, fontWeight: FontWeight.w300),
        ),
      ),
      title: 'CH-Images',
    );
  }
}
