import 'package:flutter/material.dart';
import 'package:flutter_1/repositories/crypto/crypto_repository.dart';
import 'package:flutter_1/repositories/models/CoinModel.dart';
import '../widgets/crypto_coin_tile.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});
  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CoinModel>? coinList;

  @override
  void initState() {
    super.initState();
    _loadCoinList();
  }

  void _loadCoinList() async {
    coinList = await CryptoRepository().getCoinList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: (coinList == null) ? const Center(child: CircularProgressIndicator()):
      ListView.separated(
        itemCount: coinList!.length,
        itemBuilder: (context, i) {
          final coin = coinList![i];
          return CryptoCoinTile(coin: coin);
        },
        separatorBuilder: (context, i) => const Divider(),
      ),
    );
  }
}

