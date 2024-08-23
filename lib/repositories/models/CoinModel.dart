import 'package:equatable/equatable.dart';
import 'package:flutter_1/repositories/models/CoinDetailModel.dart';
import 'package:hive/hive.dart';

part 'CoinModel.g.dart';

@HiveType(typeId: 2)
class CoinModel extends Equatable {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final CoinDetailModel details;

  const CoinModel({
    required this.name,
    required this.details
  });

  @override
  List<Object> get props => [name, details];
}