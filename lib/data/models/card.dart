import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CardData extends Equatable {
  CardData({
    @required this.name,
    @required this.about,
  });

  factory CardData.fromMap(DocumentSnapshot documentSnapshot) {
    final data = documentSnapshot.data();
    return CardData(
      name: data['name'],
      about: data['about'],
    );
  }

  final String name;
  final String about;

  @override
  List<Object> get props => [name, about];
}
