import 'package:equatable/equatable.dart';
import 'package:flutter_1/repositories/abstract_crypto_repository.dart';
import 'package:flutter_1/repositories/models/CoinDetailModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_coin_event.dart';
part 'crypto_coin_state.dart';

class CryptoCoinBloc extends Bloc<CryptoCoinEvent, CryptoCoinState> {
  final AbstractCryptoRepository coinRepository;
  final String coinName;

  CryptoCoinBloc({required  this.coinRepository, required this.coinName}) : super(CryptoCoinInitial()) {
    on<LoadCoinDetail>((event, emit) async{
      try{
        final coinDetail = await coinRepository.getCoinDetail(coinName);
        emit(CryptoCoinLoaded(coinDetail: coinDetail));
      } catch (e){
        emit(CryptoCoinFailure(exception: e));
      }
    });
  }
}