import 'package:flutter/material.dart';
import 'package:flutter_1/repositories/models/CoinModel.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin
  });

  final CoinModel coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return  ListTile(
      title: Text(coin.name, style: theme.textTheme.bodyMedium),
      subtitle: Text('${coin.price.toStringAsFixed(5)}\$', style: theme.textTheme.bodySmall),
      leading: Image.network(coin.imageUrl),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed('/coin', arguments: coin);
      },
    );
  }
}