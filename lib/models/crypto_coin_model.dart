import 'package:cryptocoin_list/models/crypto_detail_model.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'crypto_coin_model.g.dart';

@HiveType(typeId: 2)
class CryptoCoinModel extends Equatable {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final CryptoCoinDetailModel coinDetails;

  const CryptoCoinModel({
    required this.name,
    required this.coinDetails,
  });

  @override
  List<Object?> get props => [
        name,
        coinDetails,
      ];
}
