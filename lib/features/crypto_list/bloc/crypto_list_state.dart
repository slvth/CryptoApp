part of 'crypto_list_block.dart';

abstract class CryptoListState extends Equatable {}

class CryptoListInitial extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoading extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoaded extends CryptoListState {
  final List<CoinModel> coinList;
  CryptoListLoaded({required this.coinList});

  @override
  List<Object?> get props => [coinList];
}

class CryptoListFailure extends CryptoListState {
  final Object? exception;
  CryptoListFailure({required this.exception});

  @override
  List<Object?> get props => [exception];
}
