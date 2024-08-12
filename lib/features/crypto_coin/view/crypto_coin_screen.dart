import 'package:flutter/material.dart';
import 'package:flutter_1/repositories/models/CoinModel.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  CoinModel? coin;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args!=null && args is CoinModel, 'You must provide CoinModel args');
    coin = args as CoinModel;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coin!.name ?? '...')),
      body: Center(child: Text(coin!.price.toStringAsFixed(4)+"\$" ?? '...')),
    );
  }
}