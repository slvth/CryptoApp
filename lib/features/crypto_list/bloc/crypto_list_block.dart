import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_1/repositories/abstract_crypto_repository.dart';
import 'package:flutter_1/repositories/models/CoinModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

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
      catch(e, st){
        emit(CryptoListFailure(exception: e));
        GetIt.I<Talker>().handle(e, st);
      }
      finally{
        event.completer?.complete();
      }
    });
  }
  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}