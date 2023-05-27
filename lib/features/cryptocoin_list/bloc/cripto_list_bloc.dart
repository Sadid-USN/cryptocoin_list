import 'dart:async';

import 'package:cryptocoin_list/models/crypto_coin_model.dart';
import 'package:cryptocoin_list/repositories/repo_export.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
part 'cripto_list_event.dart';
part 'cripto_list_state.dart';

class CriptoListBloc extends Bloc<CriptoListEvent, CriptoListState> {
  final AbstractCriptoRepository abstractCriptoRepository;
  CriptoListBloc(this.abstractCriptoRepository) : super(CriptoListInitState()) {
    on<LoadCriptoListEvent>(_load);
  }

  Future<void> _load(
    LoadCriptoListEvent event,
    Emitter<CriptoListState> emit,
  ) async {
    try {
      if (state is! CriptoListLoaded) {
        emit(CriptoListLoading());
      }

      final coinList = await abstractCriptoRepository.getCoinList();
     
      emit(CriptoListLoaded(coinList: coinList));
    } 
    catch (error, stack) {
      emit(CriptoListLoadingFailure(error: error));
      GetIt.I<Talker>().handle(error, stack);
    } 
    
    finally {
      event.completer?.complete();
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    GetIt.I<Talker>().handle(error, stackTrace);
    super.onError(error, stackTrace);
  }
}
