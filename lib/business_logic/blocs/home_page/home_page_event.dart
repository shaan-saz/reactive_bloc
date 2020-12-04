part of 'home_page_bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class HomePageLoad extends HomePageEvent {}

class HomePageUpdate extends HomePageEvent {
  HomePageUpdate({@required this.cardList});
  final List<CardData> cardList;

  @override
  List<Object> get props => [cardList];
}
