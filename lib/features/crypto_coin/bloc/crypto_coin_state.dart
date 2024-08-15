part of 'crypto_coin_bloc.dart';

abstract class CryptoCoinState extends Equatable {}

class CryptoCoinInitial extends CryptoCoinState {
  @override
  List<Object?> get props => [];
}

class CryptoCoinLoading extends CryptoCoinState {
  @override
  List<Object?> get props => [];
}

class CryptoCoinLoaded extends CryptoCoinState {
  final CoinDetailModel coinDetail;
  CryptoCoinLoaded({required this.coinDetail});

  @override
  List<Object?> get props => [coinDetail];
}

class CryptoCoinFailure extends CryptoCoinState {
  final Object? exception;
  CryptoCoinFailure({required this.exception});

  @override
  List<Object?> get props => [exception];
}
