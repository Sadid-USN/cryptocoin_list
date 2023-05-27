


import '../models/crypto_coin_model.dart';

abstract class AbstractCriptoRepository{
Future<List<CryptoCoinModel>> getCoinList();
Future<CryptoCoinModel> getCoinDetails(String currencyCode);



}