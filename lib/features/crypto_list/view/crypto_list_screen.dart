import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_1/features/crypto_list/bloc/crypto_list_block.dart';
import 'package:flutter_1/repositories/abstract_crypto_repository.dart';
import 'package:flutter_1/repositories/models/CoinModel.dart';
import 'package:flutter_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../widgets/crypto_coin_tile.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});

  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final cryptoListBloc = CryptoListBloc(
      cryptoRepository: GetIt.instance<AbstractCryptoRepository>());

  @override
  void initState() {
    super.initState();
    cryptoListBloc.add(LoadCryptoList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            cryptoListBloc.add(LoadCryptoList(completer: completer));
            return completer.future;
          },
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
            bloc: cryptoListBloc,
            builder: (context, state) {
              if (state is CryptoListLoaded) {
                return ListView.separated(
                  itemCount: state.coinList.length,
                  itemBuilder: (context, i) {
                    final coin = state.coinList[i];
                    return CryptoCoinTile(coin: coin);
                  },
                  separatorBuilder: (context, i) => const Divider(),
                );
              }
              if (state is CryptoListFailure) {
                return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Что-то пошло не так!',
                            style: darkTheme.textTheme.bodyMedium),
                        Text('попробуйте перезапустить приложение',
                            style: darkTheme.textTheme.bodySmall),
                        TextButton(
                            onPressed: () =>
                                cryptoListBloc.add(LoadCryptoList()),
                            child: const Text('Перезапуск'))
                      ]),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
