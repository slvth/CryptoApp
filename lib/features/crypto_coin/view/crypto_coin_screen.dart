import 'package:flutter/material.dart';
import 'package:flutter_1/features/crypto_coin/bloc/crypto_coin_bloc.dart';
import 'package:flutter_1/repositories/abstract_crypto_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  CryptoCoinBloc? cryptoCoinBloc;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provide coinName args');
    String coinName = args as String;
    cryptoCoinBloc = CryptoCoinBloc(
        coinRepository: GetIt.instance<AbstractCryptoRepository>(),
        coinName: coinName);
    cryptoCoinBloc!.add(LoadCoinDetail());

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(cryptoCoinBloc?.coinName ?? '...'),
          actions: [
            IconButton(onPressed: (){
              cryptoCoinBloc!.add(LoadCoinDetail());
            }, icon: const Icon(Icons.refresh))
          ],
        ),
        body: BlocBuilder<CryptoCoinBloc, CryptoCoinState>(
          bloc: cryptoCoinBloc,
          builder: (context, state) {
            if (state is CryptoCoinLoaded) {
              final coin = state.coin;
              final coinDetail = coin.details;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      coinDetail.fullImageUrl,
                      height: 200,
                      width: 200,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Стоимость: ${coinDetail.price.toStringAsFixed(3)}\$'),
                            const SizedBox(height: 10),
                            Text('MIN за 24ч: ${coinDetail.low24Hour.toStringAsFixed(3)}\$'),
                            const SizedBox(height: 10),
                            Text('MAX за 24ч: ${coinDetail.high24Hour.toStringAsFixed(3)}\$'),
                          ]
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
            return const Center(child: RefreshProgressIndicator());
          },
        ));
  }
}
