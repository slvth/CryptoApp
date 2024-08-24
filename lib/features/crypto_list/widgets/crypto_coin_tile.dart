import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/features/crypto_list/bloc/crypto_list_block.dart';
import 'package:flutter_1/repositories/models/CoinModel.dart';
import 'package:flutter_1/router/route.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
    required this.cryptoListBloc,
  });

  final CoinModel coin;
  final CryptoListBloc cryptoListBloc;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final coinDetail = coin.details;

    return  ListTile(
      title: Text(coin.name, style: theme.textTheme.bodyMedium),
      subtitle: Text('${coinDetail.price.toStringAsFixed(5)}\$', style: theme.textTheme.bodySmall),
      leading: Image.network(coinDetail.fullImageUrl),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        AutoRouter.of(context).push(CryptoCoinRoute(coinName: coin.name)).then((_){
          cryptoListBloc.add(LoadCryptoList());
        });
        // Navigator.of(context).pushNamed('/coin', arguments: coin.name).then((_){
        //   cryptoListBloc.add(LoadCryptoList());
        // });
      },
    );
  }
}