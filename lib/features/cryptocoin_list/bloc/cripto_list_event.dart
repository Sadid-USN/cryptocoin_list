part of 'cripto_list_bloc.dart';


abstract class CriptoListEvent extends Equatable {}


class LoadCriptoListEvent extends  CriptoListEvent{
  final Completer ? completer;
  LoadCriptoListEvent({this.completer});
  
  @override
  List<Object?> get props => [completer];
}