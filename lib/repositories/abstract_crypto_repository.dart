import 'models/models.dart';

abstract class AbstractCryptoRepository{
  Future<List<CoinModel>> getCoinList();
}