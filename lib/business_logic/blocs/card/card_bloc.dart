import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:reactive_bloc/data/models/card.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(CardInitial());

  @override
  Stream<CardState> mapEventToState(
    CardEvent event,
  ) async* {
    if (event is CardOpen) {
      yield CardOpened(cardData: event.cardData);
    }
  }
}
