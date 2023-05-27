import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../../../repositories/repo_export.dart';
import '../bloc/cripto_list_bloc.dart';
import '../../cryptocoin/widgets/cryptocoin_tile.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _criptocoinListBloc =
      CriptoListBloc(GetIt.I<AbstractCriptoRepository>());
  @override
  void initState() {
    _criptocoinListBloc.add(LoadCriptoListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cryptocoin List'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
               Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TalkerScreen(
                    talker: GetIt.I<Talker>(),
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.document_scanner_outlined,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          var completer = Completer();
          _criptocoinListBloc.add(LoadCriptoListEvent(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<CriptoListBloc, CriptoListState>(
          bloc: _criptocoinListBloc,
          builder: (context, state) {
            if (state is CriptoListLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.only(top: 30),
                itemCount: state.coinList.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  var coin = state.coinList[index];
                  return CtyptocoinTile(
                    coin: coin,
                  );
                },
              );
            }
            if (state is CriptoListLoadingFailure) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Somting went wrong",
                        style: theme.textTheme.labelMedium,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _criptocoinListBloc.add(LoadCriptoListEvent());
                          },
                          child: const Text('Try Again'))
                    ],
                  ),
                ),
              );
            }

            return const Center(
              child: SizedBox(width: 100, child: LinearProgressIndicator()),
            );
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {

      //       _criptocoinListBloc.add(LoadCriptoListEvent());
      //   setState(() {

      //   });

      //   },
      //   child: const Icon(Icons.refresh),
      // ),
    );
  }
}
