import 'package:equatable/equatable.dart';

class CoinDetailModel extends Equatable {
  final String name;
  final double price;
  final String imageUrl;
  final double low24Hour;
  final double high24Hour;

  const CoinDetailModel({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.low24Hour,
    required this.high24Hour,
  });

  @override
  List<Object> get props => [name, price, imageUrl, low24Hour, high24Hour];
}
