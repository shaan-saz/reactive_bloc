part of 'home_page_bloc.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

class HomePageInProgress extends HomePageState {}

class HomePageUpdated extends HomePageState {
  HomePageUpdated({@required this.cardList});

  final List<CardData> cardList;

  @override
  List<Object> get props => [cardList];
}
