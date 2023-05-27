import 'package:auto_route/auto_route.dart';
import 'package:cryptocoin_list/features/cryptocoin/bloc/crypto_coin_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import '../../../models/crypto_coin_model.dart';
import '../../../repositories/abbstract_repository.dart';

@RoutePage()
class CoinDetailPage extends StatefulWidget {
  final CryptoCoinModel? coin;
  const CoinDetailPage({
    super.key,
    this.coin,
  });
  @override
  // ignore: library_private_types_in_public_api
  _CoinDetailPageState createState() => _CoinDetailPageState();
}

class _CoinDetailPageState extends State<CoinDetailPage> {
  final _coinDetailsBloc = CriptoCoinDetailsBloc(
    GetIt.I<AbstractCriptoRepository>(),
  );

  @override
  void initState() {
    _coinDetailsBloc.add(LoadCriptoListEvent(currencyCode: widget.coin!.name));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //  final coin = ModalRoute.of(context)!.settings.arguments as CryptoCoinModel;
    var theme = Theme.of(context).textTheme.titleLarge;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Coin details'),
          centerTitle: true,
        ),
        body: BlocBuilder<CriptoCoinDetailsBloc, CryptoCoinDetailsState>(
          bloc: _coinDetailsBloc,
          builder: (context, state) {
            if (state is CryptoCoinDetailsLoaded) {
              final coin = state.coin;
              // final coinDetails = coin.coinDetails;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      coin.name,
                      style: theme,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Image.network(
                      coin.coinDetails.fullImageUrl,
                      height: 200,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black26,
                      ),
                      child:
                          Text("Price In USD: ${coin.coinDetails.priceInUSD}"),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black26,
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Height 24 hours : ${coin.coinDetails.hight24Hour}'),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                                'Low 24 hours : ${coin.coinDetails.low24Hours}'),
                          ]),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black26,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectableText(
                            "LastUpdate: ${formatDate(coin.coinDetails.lastUpdate, 0)}",
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SelectableText(
                            "Time: ${formatDate(coin.coinDetails.lastUpdate, 1)}",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ));
  }

  String formatDate(DateTime dateTime, int index) {
    if (index == 0) {
      return DateFormat('yyyy-MM-dd').format(dateTime);
    } else if (index == 1) {
      return DateFormat('HH:mm').format(dateTime);
    }
    // Handle other index values if needed
    return '';
  }
}
