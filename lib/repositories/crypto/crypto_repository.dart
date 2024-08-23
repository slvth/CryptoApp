import 'package:dio/dio.dart';
import 'package:flutter_1/repositories/abstract_crypto_repository.dart';
import 'package:flutter_1/repositories/models/models.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoRepository implements AbstractCryptoRepository {
  final Dio dio;
  final Box<CoinModel> cryptoBox;

  CryptoRepository({
    required this.dio,
    required this.cryptoBox,
  });

  @override
  Future<List<CoinModel>> getCoinList() async {
    var coinList = <CoinModel>[];
    try {
      coinList = await _downloadCoinList();
      // collection-for (перевод List<CoinModel> в Map<string, CoinModel>)
      // Источник: https://stackoverflow.com/questions/16831535/how-to-convert-a-list-into-a-map-in-dart
      var coinListMap = {for(var coin in coinList) coin.name: coin};
      await cryptoBox.putAll(coinListMap);
    } catch (e, st) {
      GetIt.instance<Talker>().handle(e, st);
      coinList = cryptoBox.values.toList();
    }
    coinList.sort((a,b)=>b.details.price.compareTo(a.details.price));
    return coinList;
  }

  Future<List<CoinModel>> _downloadCoinList() async {
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
    try {
      final coin = await _downloadCoinDetail(coinName);
      await cryptoBox.put(coinName, coin);
      return coin;
    } catch (e, st) {
      GetIt.instance<Talker>().handle(e, st);
      return cryptoBox.get(coinName)!;
    }
  }

  Future<CoinModel> _downloadCoinDetail(String coinName) async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$coinName&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[coinName] as Map<String, dynamic>;
    final coinDataUSD = coinData['USD'] as Map<String, dynamic>;
    final details = CoinDetailModel.fromJson(coinDataUSD);

    return CoinModel(name: coinName, details: details);
  }
}
