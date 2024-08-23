import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'CoinDetailModel.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class CoinDetailModel extends Equatable {
  @HiveField(0)
  @JsonKey(name: 'PRICE')
  final double price;

  @HiveField(1)
  @JsonKey(name: 'IMAGEURL')
  final String imageUrl;

  @HiveField(2)
  @JsonKey(name: 'LOW24HOUR')
  final double low24Hour;

  @HiveField(3)
  @JsonKey(name: 'HIGH24HOUR')
  final double high24Hour;

  @HiveField(4)
  @JsonKey(name: 'LASTUPDATE', fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  final DateTime lastUpdate;

  //Получение полной ссылки для отображения изображения
  String get fullImageUrl {
    return 'https://www.cryptocompare.com/$imageUrl';
  }

  //Перевод миллисекунд в формат DateTime и обратно
  static DateTime _dateTimeFromJson(int time) =>
      DateTime.fromMillisecondsSinceEpoch(time * 1000);

  static int _dateTimeToJson(DateTime time) => time.millisecondsSinceEpoch;

  const CoinDetailModel({
    required this.price,
    required this.imageUrl,
    required this.low24Hour,
    required this.high24Hour,
    required this.lastUpdate,
  });

  @override
  List<Object> get props =>
      [price, imageUrl, low24Hour, high24Hour, lastUpdate];

  factory CoinDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CoinDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoinDetailModelToJson(this);
}
