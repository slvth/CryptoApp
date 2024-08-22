import 'models/models.dart';

abstract class AbstractCryptoRepository{
  Future<List<CoinModel>> getCoinList();
  Future<CoinModel> getCoinDetail(String coinName);
}