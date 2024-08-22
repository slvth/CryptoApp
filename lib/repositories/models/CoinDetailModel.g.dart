// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CoinDetailModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinDetailModel _$CoinDetailModelFromJson(Map<String, dynamic> json) =>
    CoinDetailModel(
      price: (json['PRICE'] as num).toDouble(),
      imageUrl: json['IMAGEURL'] as String,
      low24Hour: (json['LOW24HOUR'] as num).toDouble(),
      high24Hour: (json['HIGH24HOUR'] as num).toDouble(),
      lastUpdate: CoinDetailModel._dateTimeFromJson(
          (json['LASTUPDATE'] as num).toInt()),
    );

Map<String, dynamic> _$CoinDetailModelToJson(CoinDetailModel instance) =>
    <String, dynamic>{
      'PRICE': instance.price,
      'IMAGEURL': instance.imageUrl,
      'LOW24HOUR': instance.low24Hour,
      'HIGH24HOUR': instance.high24Hour,
      'LASTUPDATE': CoinDetailModel._dateTimeToJson(instance.lastUpdate),
    };
