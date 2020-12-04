import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_bloc/data/repositories/card_repository.dart';

import 'app.dart';
import 'business_logic/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    MyApp(
      cardRepository: CardRepository(),
    ),
  );
}
