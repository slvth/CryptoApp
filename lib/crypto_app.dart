import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'router/route.dart';
import 'theme/theme.dart';

class CryptoApp extends StatefulWidget {
  const CryptoApp({super.key});

  @override
  State<CryptoApp> createState() => _CryptoAppState();
}

class _CryptoAppState extends State<CryptoApp> {
  //Auto_Route
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: darkTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(
          navigatorObservers: () => [TalkerRouteObserver(GetIt.I<Talker>())]),
    );
  }
}
