import 'package:equatable/equatable.dart';
import 'package:flutter_1/repositories/models/CoinDetailModel.dart';

class CoinModel extends Equatable {
  final String name;
  final CoinDetailModel details;

  const CoinModel({
    required this.name,
    required this.details
  });

  @override
  List<Object> get props => [name, details];
}