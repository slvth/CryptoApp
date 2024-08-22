import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'CoinDetailModel.g.dart';

@JsonSerializable()
class CoinDetailModel extends Equatable {
  @JsonKey(name: 'PRICE')
  final double price;
  @JsonKey(name: 'IMAGEURL')
  final String imageUrl;
  @JsonKey(name: 'LOW24HOUR')
  final double low24Hour;
  @JsonKey(name: 'HIGH24HOUR')
  final double high24Hour;
  @JsonKey(
    name: 'LASTUPDATE',
    fromJson: _dateTimeFromJson,
    toJson: _dateTimeToJson,
  )
  final DateTime lastUpdate;

  //Получение полной ссылки для отображения изображения
  String get fullImageUrl {
    return 'https://www.cryptocompare.com/$imageUrl';
  }

  //Перевод миллисекунд в формат DateTime и обратно
  static DateTime _dateTimeFromJson(int time) => DateTime.fromMillisecondsSinceEpoch(time*1000);
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
