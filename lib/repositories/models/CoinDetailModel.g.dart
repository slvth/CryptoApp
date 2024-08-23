// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CoinDetailModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoinDetailModelAdapter extends TypeAdapter<CoinDetailModel> {
  @override
  final int typeId = 1;

  @override
  CoinDetailModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoinDetailModel(
      price: fields[0] as double,
      imageUrl: fields[1] as String,
      low24Hour: fields[2] as double,
      high24Hour: fields[3] as double,
      lastUpdate: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CoinDetailModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.price)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.low24Hour)
      ..writeByte(3)
      ..write(obj.high24Hour)
      ..writeByte(4)
      ..write(obj.lastUpdate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoinDetailModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
