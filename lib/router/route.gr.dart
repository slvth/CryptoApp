// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'route.dart';

/// generated route for
/// [CryptoCoinScreen]
class CryptoCoinRoute extends PageRouteInfo<CryptoCoinRouteArgs> {
  CryptoCoinRoute({
    Key? key,
    required String coinName,
    List<PageRouteInfo>? children,
  }) : super(
          CryptoCoinRoute.name,
          args: CryptoCoinRouteArgs(
            key: key,
            coinName: coinName,
          ),
          initialChildren: children,
        );

  static const String name = 'CryptoCoinRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CryptoCoinRouteArgs>();
      return CryptoCoinScreen(
        key: args.key,
        coinName: args.coinName,
      );
    },
  );
}

class CryptoCoinRouteArgs {
  const CryptoCoinRouteArgs({
    this.key,
    required this.coinName,
  });

  final Key? key;

  final String coinName;

  @override
  String toString() {
    return 'CryptoCoinRouteArgs{key: $key, coinName: $coinName}';
  }
}

/// generated route for
/// [CryptoListScreen]
class CryptoListRoute extends PageRouteInfo<CryptoListRouteArgs> {
  CryptoListRoute({
    Key? key,
    String title = 'Crypto App',
    List<PageRouteInfo>? children,
  }) : super(
          CryptoListRoute.name,
          args: CryptoListRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'CryptoListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CryptoListRouteArgs>(
          orElse: () => const CryptoListRouteArgs());
      return CryptoListScreen(
        key: args.key,
        title: args.title,
      );
    },
  );
}

class CryptoListRouteArgs {
  const CryptoListRouteArgs({
    this.key,
    this.title = 'Crypto App',
  });

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'CryptoListRouteArgs{key: $key, title: $title}';
  }
}
