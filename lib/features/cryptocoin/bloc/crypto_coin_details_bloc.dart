import 'dart:async';
import 'package:cryptocoin_list/models/crypto_coin_model.dart';
import 'package:cryptocoin_list/repositories/repo_export.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'crypto_detail_event.dart';
part 'crypto_datail_state.dart';

class CriptoCoinDetailsBloc extends Bloc<CryptoDetailEvent, CryptoCoinDetailsState> {
  final AbstractCriptoRepository abstractCriptoRepository;
  CriptoCoinDetailsBloc(this.abstractCriptoRepository) : super(const CryptoCoinDetailsState()) {
    on<LoadCriptoListEvent>(_loadDetail);
  }

  Future<void> _loadDetail(
    LoadCriptoListEvent event,
    Emitter<CryptoCoinDetailsState> emit,
  ) async {
    try {
      if (state is! CryptoCoinDetailsLoaded) {
        emit(const CryptoCoinDetailsLoading());
      }

      final detail = await abstractCriptoRepository.getCoinDetails(event.currencyCode);
        

      emit(CryptoCoinDetailsLoaded(detail));
    }catch (e, st) {
      emit(CryptoCoinDetailsLoadingFailure(e));
      GetIt.I<Talker>().handle(e, st);
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    GetIt.I<Talker>().handle(error, stackTrace);
    super.onError(error, stackTrace);
  }
}
