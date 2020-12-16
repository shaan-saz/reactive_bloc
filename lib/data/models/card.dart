import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CardData extends Equatable {
  CardData({
    @required this.name,
    @required this.about,
    @required this.id,
  });

  factory CardData.fromMap(DocumentSnapshot documentSnapshot) {
    final data = documentSnapshot.data();
    return CardData(
      name: data['name'],
      about: data['about'],
      id: data['id'],
    );
  }

  final String name;
  final String about;
  final int id;

  @override
  List<Object> get props => [name, about];
}
