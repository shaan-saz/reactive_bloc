import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:reactive_bloc/data/models/card.dart';
import 'package:reactive_bloc/data/repositories/card_repository.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc({@required CardRepository cardRepository})
      : assert(cardRepository != null),
        _cardRepository = cardRepository,
        super(
          HomePageInProgress(),
        );

  final CardRepository _cardRepository;
  StreamSubscription cardListSubscription;

  @override
  Stream<HomePageState> mapEventToState(
    HomePageEvent event,
  ) async* {
    if (event is HomePageLoad) {
      yield* _mapHomePageLoadToState();
    }
    if (event is HomePageUpdate) {
      yield HomePageUpdated(cardList: event.cardList);
    }
  }

  Stream<HomePageState> _mapHomePageLoadToState() async* {
    yield HomePageInProgress();
    final cardStream = _cardRepository.fetchCardList();
    await cardListSubscription?.cancel();
    cardListSubscription = cardStream.listen(
      (event) {
        add(
          HomePageUpdate(cardList: event),
        );
      },
    );
  }

  @override
  Future<void> close() {
    cardListSubscription?.cancel();
    return super.close();
  }
}
