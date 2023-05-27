import 'package:auto_route/auto_route.dart';
import 'package:cryptocoin_list/models/crypto_coin_model.dart';
import 'package:cryptocoin_list/router/routes.dart';
import 'package:flutter/material.dart';

class CtyptocoinTile extends StatelessWidget {
 final CryptoCoinModel coin;
 const CtyptocoinTile({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
   

    return ListTile(
      onTap: () {
        // Navigator.pushNamed(context, 'coindetail', arguments: coin);
         AutoRouter.of(context).push(CoinDetailRoute(coin: coin));
      },
      leading: Image.network(coin.coinDetails.fullImageUrl),
      title: Text(coin.name, style: theme.textTheme.headlineMedium),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${coin.coinDetails.priceInUSD} \$',
            style: theme.textTheme.labelSmall,
          ),
          const SizedBox(
            width: 12,
          ),
          // Text(
          //   coin.coinDetails.toSymbol,
          //   style: theme.textTheme.labelLarge
          // ),
        ],
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
