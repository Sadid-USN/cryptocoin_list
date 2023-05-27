part of 'cripto_list_bloc.dart';

abstract class CriptoListState extends Equatable {}

class CriptoListInitState extends CriptoListState {
  @override
  List<Object?> get props => [];
}

class CriptoListLoading extends CriptoListState {
  @override
  List<Object?> get props => [];
}

class CriptoListLoaded extends CriptoListState {
  final List<CryptoCoinModel> coinList;
  CriptoListLoaded({required this.coinList});

  @override
  List<Object?> get props => [coinList];
}

class CriptoListLoadingFailure extends CriptoListState {
  final Object error;
  CriptoListLoadingFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
class DisconnectInternet extends CriptoListState {
  final Object error;
  DisconnectInternet({required this.error});

  @override
  List<Object?> get props => [error];
}
