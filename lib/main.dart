import 'package:buffer/core/theming/dark_theme.dart';
import 'package:buffer/features/home/pages/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Global navigation key
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const ProviderScope(overrides: [], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buffer',
      themeMode: ThemeMode.dark,
      darkTheme: DarkTheme.getTheme(),
      navigatorKey: navigatorKey,
      home: WillPopScope(
          onWillPop: () async => !await navigatorKey.currentState!.maybePop(),
          child: LayoutBuilder(builder: (context, constraints) {
            return const HomePageView();
          })),
    );
  }
}
