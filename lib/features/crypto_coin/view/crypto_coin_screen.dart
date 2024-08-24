import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/features/crypto_coin/bloc/crypto_coin_bloc.dart';
import 'package:flutter_1/repositories/abstract_crypto_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class CryptoCoinScreen extends StatefulWidget {
  final String coinName;
  const CryptoCoinScreen({super.key, required this.coinName});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  CryptoCoinBloc? cryptoCoinBloc;

  @override
  void initState() {
    super.initState();
    cryptoCoinBloc = CryptoCoinBloc(
        coinRepository: GetIt.instance<AbstractCryptoRepository>(),
        coinName: widget.coinName);
    cryptoCoinBloc!.add(LoadCoinDetail());
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
