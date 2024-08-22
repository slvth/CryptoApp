import 'package:equatable/equatable.dart';
import 'package:flutter_1/repositories/abstract_crypto_repository.dart';
import 'package:flutter_1/repositories/models/CoinModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'crypto_coin_event.dart';
part 'crypto_coin_state.dart';

class CryptoCoinBloc extends Bloc<CryptoCoinEvent, CryptoCoinState> {
  final AbstractCryptoRepository coinRepository;
  final String coinName;

  CryptoCoinBloc({required  this.coinRepository, required this.coinName}) : super(CryptoCoinInitial()) {
    on<LoadCoinDetail>((event, emit) async{
      try{
        final coinDetail = await coinRepository.getCoinDetail(coinName);
        emit(CryptoCoinLoaded(coin: coinDetail));
      } catch (e, st){
        emit(CryptoCoinFailure(exception: e));
        GetIt.I<Talker>().handle(e, st);
      }
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}