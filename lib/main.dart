import 'dart:async';

import 'package:cryptocoin_list/router/routes.dart';
import 'package:cryptocoin_list/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'd_injection/d_injection.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initDependencies();
    runApp(MyApp());
  }, (error, stack) {
    return GetIt.I<Talker>().handle(error, stack);
  });
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _autorouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Cryptocoin List',
      theme: darkTheme,
      routerConfig: _autorouter.config(
        navigatorObservers: () => [
          TalkerRouteObserver(
            GetIt.I<Talker>(),
          ),
        ],
      ),
    );
  }
}
