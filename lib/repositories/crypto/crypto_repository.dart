import 'package:dio/dio.dart';
import 'package:flutter_1/repositories/abstract_crypto_repository.dart';
import 'package:flutter_1/repositories/models/models.dart';

class CryptoRepository implements AbstractCryptoRepository {
  final Dio dio;

  CryptoRepository({
    required this.dio
  });

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
      return CoinModel(name:name, price: price, imageUrl: imageUrl);
    }).toList();
    return coinList;
  }
}
