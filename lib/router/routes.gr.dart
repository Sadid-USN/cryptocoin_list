// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CoinDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CoinDetailRouteArgs>(
          orElse: () => const CoinDetailRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CoinDetailPage(
          key: args.key,
          coin: args.coin,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
  };
}

/// generated route for
/// [CoinDetailPage]
class CoinDetailRoute extends PageRouteInfo<CoinDetailRouteArgs> {
  CoinDetailRoute({
    Key? key,
    CryptoCoinModel? coin,
    List<PageRouteInfo>? children,
  }) : super(
          CoinDetailRoute.name,
          args: CoinDetailRouteArgs(
            key: key,
            coin: coin,
          ),
          initialChildren: children,
        );

  static const String name = 'CoinDetailRoute';

  static const PageInfo<CoinDetailRouteArgs> page =
      PageInfo<CoinDetailRouteArgs>(name);
}

class CoinDetailRouteArgs {
  const CoinDetailRouteArgs({
    this.key,
    this.coin,
  });

  final Key? key;

  final CryptoCoinModel? coin;

  @override
  String toString() {
    return 'CoinDetailRouteArgs{key: $key, coin: $coin}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
