import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/repositories/abstract_crypto_repository.dart';
import 'package:flutter_1/repositories/crypto/crypto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'crypto_app.dart';

void main() {
  //Talker
  final talker = TalkerFlutter.init();
  GetIt.instance.registerSingleton(talker);
  GetIt.I<Talker>().debug('Talker started...');

  //Talker Dio (http)
  final dio = Dio();
  dio.interceptors.add(TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(printResponseData: false)));
  GetIt.instance.registerLazySingleton<AbstractCryptoRepository>(
      () => CryptoRepository(dio: dio));

  //Talker Bloc (DI)
  Bloc.observer = TalkerBlocObserver(talker: talker);

  //Run app
  runZonedGuarded(() => runApp(const CryptoApp()), (e, st) {
    GetIt.I<Talker>().handle(e, st);
  });
}
