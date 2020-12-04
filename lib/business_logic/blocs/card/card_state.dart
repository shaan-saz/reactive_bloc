part of 'card_bloc.dart';

abstract class CardState extends Equatable {
  const CardState();

  @override
  List<Object> get props => [];
}

class CardInitial extends CardState {}

class CardOpened extends CardState {
  CardOpened({
    @required this.cardData,
  });

  final CardData cardData;

  @override
  List<Object> get props => [cardData];
}
