import 'package:cryptocoin_list/models/crypto_coin_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../models/crypto_detail_model.dart';
import 'repo_export.dart';

class CriptoRepoImpl implements AbstractCriptoRepository {
  final Dio dio;
  final Box<CryptoCoinModel> cryptoCoinsBox;
  CriptoRepoImpl({required this.dio, required this.cryptoCoinsBox});
  @override
  Future<List<CryptoCoinModel>> getCoinList() async {
    var cryptoCoinsList = <CryptoCoinModel>[];
    try {
      cryptoCoinsList = await _fetchCoinsList();

      final cyptocoinMap = {for (var e in cryptoCoinsList) e.name: e};
      await cryptoCoinsBox.putAll(cyptocoinMap);
    } catch (error, stack) {
      GetIt.instance<Talker>().handle(error, stack);
      cryptoCoinsList = cryptoCoinsBox.values.toList();
    }

    // Сортировка  крипы по убыванию по ценам, что бы списки из кэша вернули тот же порядок, что и в API
    cryptoCoinsList.sort(
        (a, b) => b.coinDetails.priceInUSD.compareTo(a.coinDetails.priceInUSD));
    return cryptoCoinsList;
  }

  Future<List<CryptoCoinModel>> _fetchCoinsList() async {
    final response = await dio.get(
        "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AAC,ADB,AMLT,ALX,APIS,AXPR&tsyms=USD");

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final details = CryptoCoinDetailModel.fromJson(usdData);
      return CryptoCoinModel(name: e.key, coinDetails: details);
    }).toList();
    return cryptoCoinsList;
  }

  @override
  Future<CryptoCoinModel> getCoinDetails(String currencyCode) async {
    try {
      final coin = await _fetchCoinDetailsFromApi(currencyCode);
      cryptoCoinsBox.put(currencyCode, coin);
      return coin;
    } catch (e, st) {
      GetIt.instance<Talker>().handle(e, st);

      return cryptoCoinsBox.get(currencyCode)!;
    }
  }

  Future<CryptoCoinModel> _fetchCoinDetailsFromApi(String currencyCode) async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData = coinData['USD'] as Map<String, dynamic>;
    final details = CryptoCoinDetailModel.fromJson(usdData);
    return CryptoCoinModel(name: currencyCode, coinDetails: details);
  }
}
