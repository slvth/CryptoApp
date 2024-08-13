import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_1/repositories/abstract_crypto_repository.dart';
import 'package:flutter_1/repositories/models/CoinModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_list_state.dart';
part 'crypto_list_event.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  final AbstractCryptoRepository cryptoRepository;

  CryptoListBloc({required this.cryptoRepository}) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try{
        if(state is! CryptoListLoaded){
          emit(CryptoListLoading());
        }

        final coinList = await cryptoRepository.getCoinList();
        emit(CryptoListLoaded(coinList: coinList));
      }
      catch(e){
        emit(CryptoListFailure(exception: e));
        print('exception! exception!');
      }
      finally{
        event.completer?.complete();
      }
    });

  }
}