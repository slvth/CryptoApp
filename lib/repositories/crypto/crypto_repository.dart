import 'package:dio/dio.dart';
import 'package:flutter_1/repositories/abstract_crypto_repository.dart';
import 'package:flutter_1/repositories/models/models.dart';

class CryptoRepository implements AbstractCryptoRepository {
  final Dio dio;

  CryptoRepository({required this.dio});

  @override
  Future<List<CoinModel>> getCoinList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,LTC,DOGE,BCH&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinList = dataRaw.entries.map((e) {
      final dataDetail =
      (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final name = e.key;
      final details = CoinDetailModel.fromJson(dataDetail);
      return CoinModel(name: name, details: details);
    }).toList();

    return coinList;
  }

  @override
  Future<CoinModel> getCoinDetail(String coinName) async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=${coinName}&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[coinName] as Map<String, dynamic>;
    final coinDataUSD = coinData['USD'] as Map<String, dynamic>;
    final details = CoinDetailModel.fromJson(coinDataUSD);

    return CoinModel(name: coinName, details:details);
  }
}
