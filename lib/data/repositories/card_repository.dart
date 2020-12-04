import 'package:reactive_bloc/data/providers/firestore_client.dart';
import 'package:reactive_bloc/data/models/card.dart';

class CardRepository {
  FirestoreClient firestoreClient = FirestoreClient();

  Stream<List<CardData>> fetchCardList() {
    final firestoreStream = firestoreClient.fetchCardList();
    final cardListStream = firestoreStream.map(
      (event) => event.docs
          .map(
            (e) => CardData.fromMap(e),
          )
          .toList(),
    );
    return cardListStream;
  }
}
