// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_detail_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CryptoCoinDetailModelAdapter extends TypeAdapter<CryptoCoinDetailModel> {
  @override
  final int typeId = 1;

  @override
  CryptoCoinDetailModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CryptoCoinDetailModel(
      priceInUSD: fields[4] as double,
      imageUrl: fields[5] as String,
      toSymbol: fields[0] as String,
      lastUpdate: fields[1] as DateTime,
      hight24Hour: fields[2] as double,
      low24Hours: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CryptoCoinDetailModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.toSymbol)
      ..writeByte(1)
      ..write(obj.lastUpdate)
      ..writeByte(2)
      ..write(obj.hight24Hour)
      ..writeByte(3)
      ..write(obj.low24Hours)
      ..writeByte(4)
      ..write(obj.priceInUSD)
      ..writeByte(5)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoCoinDetailModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCoinDetailModel _$CryptoCoinDetailModelFromJson(
        Map<String, dynamic> json) =>
    CryptoCoinDetailModel(
      priceInUSD: (json['PRICE'] as num).toDouble(),
      imageUrl: json['IMAGEURL'] as String,
      toSymbol: json['TOSYMBOL'] as String,
      lastUpdate:
          CryptoCoinDetailModel._dateTimeFromJson(json['LASTUPDATE'] as int),
      hight24Hour: (json['HIGH24HOUR'] as num).toDouble(),
      low24Hours: (json['LOW24HOUR'] as num).toDouble(),
    );

Map<String, dynamic> _$CryptoCoinDetailModelToJson(
        CryptoCoinDetailModel instance) =>
    <String, dynamic>{
      'TOSYMBOL': instance.toSymbol,
      'LASTUPDATE': CryptoCoinDetailModel._dateTimeToJson(instance.lastUpdate),
      'HIGH24HOUR': instance.hight24Hour,
      'LOW24HOUR': instance.low24Hours,
      'PRICE': instance.priceInUSD,
      'IMAGEURL': instance.imageUrl,
    };
