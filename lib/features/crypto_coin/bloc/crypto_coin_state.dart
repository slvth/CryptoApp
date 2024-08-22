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
  final CoinModel coin;
  CryptoCoinLoaded({required this.coin});

  @override
  List<Object?> get props => [coin];
}

class CryptoCoinFailure extends CryptoCoinState {
  final Object? exception;
  CryptoCoinFailure({required this.exception});

  @override
  List<Object?> get props => [exception];
}
