import 'package:dio/dio.dart';
import '../models/CoinModel.dart';

class CryptoRepository {
  Future<List<CoinModel>> getCoinList() async {
    final response = await Dio().get('https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,LTC,DOGE,BCH&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinList = dataRaw.entries.map((e) {
      final dataDetail = (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final name = e.key;
      final price = dataDetail['PRICE'];
      final imageUrl = 'https://www.cryptocompare.com/${dataDetail['IMAGEURL']}';
      return CoinModel(name, price, imageUrl);
    }).toList();
    return coinList;
  }
}
