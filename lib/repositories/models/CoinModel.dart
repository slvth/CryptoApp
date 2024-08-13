import 'package:equatable/equatable.dart';

class CoinModel extends Equatable {
  final String name;
  final double price;
  final String imageUrl;

  const CoinModel({
    required this.name,
    required this.price,
    required this.imageUrl
  });

  @override
  List<Object> get props => [name, price, imageUrl];
}