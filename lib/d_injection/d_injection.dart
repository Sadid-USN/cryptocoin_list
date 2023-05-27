import 'package:cryptocoin_list/firebase_options.dart';
import 'package:cryptocoin_list/repositories/abbstract_repository.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import 'package:talker_flutter/talker_flutter.dart';
import '../models/crypto_coin_model.dart';
import '../models/crypto_detail_model.dart';

import '../repositories/cripto_repo_impl.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  final dio = Dio();
  // interceptors Получает информацию о любом запросе, который производит клиент Dio
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printResponseData: false,
        printRequestHeaders: true,
        printResponseHeaders: true,
        printResponseMessage: true,
      ),
    ),
  );

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(
      printStateFullData: false,
      printEventFullData: false
    )
  );

  await Hive.initFlutter();
  Hive.registerAdapter(CryptoCoinModelAdapter());
  Hive.registerAdapter(CryptoCoinDetailModelAdapter());
  const boxName = 'crypto_coins_box';
  final cryptoCoinsBox =
      await Hive.openBox<CryptoCoinModel>(boxName);

  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  GetIt.I.registerLazySingleton<AbstractCriptoRepository>(() => CriptoRepoImpl(
        dio: dio,
        cryptoCoinsBox: cryptoCoinsBox,
      ));

    await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
   );


}
