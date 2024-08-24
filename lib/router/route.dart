import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../features/crypto_coin/crypto_coin.dart';
import '../features/crypto_list/crypto_list.dart';

part 'route.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: CryptoListRoute.page, path: '/'),
    AutoRoute(page: CryptoCoinRoute.page, ),
  ];
}

// final routes = {
//   '/': (context) => CryptoListScreen(title: 'Crypto App'),
//   '/coin': (context) => CryptoCoinScreen(),
// };