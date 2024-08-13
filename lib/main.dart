import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/repositories/abstract_crypto_repository.dart';
import 'package:flutter_1/repositories/crypto/crypto.dart';
import 'package:get_it/get_it.dart';
import 'crypto_app.dart';

void main() {
  GetIt.instance.registerLazySingleton<AbstractCryptoRepository>(()=>CryptoRepository(dio: Dio()));
  runApp(const CryptoApp());
}



