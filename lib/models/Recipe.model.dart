import 'package:cloud_firestore/cloud_firestore.dart';

class Recipe{
  String title;
  String description;
  List<String> ingredients;

  Recipe(this.title, this.description, this.ingredients);

  Map<String, dynamic> toMap() {
    return {'title':title, 'description': description, 'ingredients': ingredients};
  }

  factory Recipe.fromMap(DocumentSnapshot data) {
    return Recipe(data['title'], data['description'], data['ingredients']);
  }

}