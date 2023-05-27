import 'package:auto_route/auto_route.dart';
import 'package:cryptocoin_list/features/cryptocoin/view/coin_detail_page.dart';
import 'package:cryptocoin_list/features/cryptocoin_list/view/home_page.dart';
import 'package:cryptocoin_list/models/crypto_coin_model.dart';
import 'package:flutter/material.dart';
part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
 
  @override
  List<AutoRoute> get routes => [
     
       AutoRoute(page: HomeRoute.page, path: "/"),
       AutoRoute(page: CoinDetailRoute.page),
      ];
}

// final routes = {
//   "/": (context) => const HomePage(),
//   "coindetail": (context) =>   CoinDetails(),
 
// };
