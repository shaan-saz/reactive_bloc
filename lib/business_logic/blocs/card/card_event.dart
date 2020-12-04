part of 'card_bloc.dart';

abstract class CardEvent extends Equatable {
  const CardEvent();

  @override
  List<Object> get props => [];
}

class CardOpen extends CardEvent {
  CardOpen({
    @required this.cardData,
  });

  final CardData cardData;

  @override
  List<Object> get props => [cardData];
}
