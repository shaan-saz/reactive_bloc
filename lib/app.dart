import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_bloc/data/models/card.dart';
import 'package:reactive_bloc/data/repositories/card_repository.dart';

import 'business_logic/blocs/card/card_bloc.dart';
import 'business_logic/blocs/home_page/home_page_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
    @required this.cardRepository,
  })  : assert(cardRepository != null),
        super(key: key);

  final CardRepository cardRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: cardRepository,
      child: BlocProvider(
        create: (_) => HomePageBloc(
          cardRepository: cardRepository,
        )..add(
            HomePageLoad(),
          ),
        child: MaterialApp(
          title: 'Reactive Bloc',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: const AppView(title: 'Reactive Bloc Home Page'),
        ),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          if (state is HomePageUpdated) {
            return ListView.builder(
              itemCount: state.cardList.length,
              itemBuilder: (context, index) {
                return CardWidget.route(
                  cardData: state.cardList[index],
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({Key key}) : super(key: key);

  static Widget route({@required CardData cardData}) {
    return BlocProvider(
      create: (_) => CardBloc()
        ..add(
          CardOpen(cardData: cardData),
        ),
      child: const CardWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardBloc, CardState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is CardOpened) {
          return ListTile(
            title: Text('${state.cardData.name}'),
            subtitle: Text('${state.cardData.about}'),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
