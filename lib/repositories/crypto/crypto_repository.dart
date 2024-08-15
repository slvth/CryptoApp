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
      final price = dataDetail['PRICE'];
      final imageUrl =
          'https://www.cryptocompare.com/${dataDetail['IMAGEURL']}';
      return CoinModel(name: name, price: price, imageUrl: imageUrl);
    }).toList();

    return coinList;
  }

  @override
  Future<CoinDetailModel> getCoinDetail(String coinName) async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=${coinName}&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[coinName] as Map<String, dynamic>;
    final coinDataUSD = coinData['USD'] as Map<String, dynamic>;
    final name = coinName;
    final price = coinDataUSD['PRICE'];
    final imageUrl = 'https://www.cryptocompare.com/${coinDataUSD['IMAGEURL']}';
    final low24Hour = coinDataUSD['LOW24HOUR'];
    final high24Hour = coinDataUSD['HIGH24HOUR'];

    return CoinDetailModel(
        name: name,
        price: price,
        imageUrl: imageUrl,
        low24Hour: low24Hour,
        high24Hour: high24Hour);
  }
}
