import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreClient {
  FirestoreClient({
    FirebaseFirestore firebaseFirestore,
  }) : _firestoreDatabase = firebaseFirestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestoreDatabase;

  Stream<QuerySnapshot> fetchCardList() {
    final cardsReference = _firestoreDatabase.collection('cards').snapshots();
    return cardsReference;
  }
}
