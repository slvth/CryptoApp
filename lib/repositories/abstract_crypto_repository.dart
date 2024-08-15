import 'models/models.dart';

abstract class AbstractCryptoRepository{
  Future<List<CoinModel>> getCoinList();
  Future<CoinDetailModel> getCoinDetail(String coinName);
}