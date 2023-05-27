part of 'crypto_coin_details_bloc.dart';



abstract class CryptoDetailEvent extends Equatable {}




class LoadCriptoListEvent extends  CryptoDetailEvent{
 final String currencyCode;
  LoadCriptoListEvent({required this.currencyCode});
  
  @override
  List<Object?> get props => [currencyCode];
}