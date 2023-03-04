import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/Recipe.model.dart';

class RecipeRepository {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('recipes');

  Stream<List<Recipe>> recipes() {
    return _collectionReference
        .orderBy('title')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Recipe.fromMap(doc)).toList());
  }

  Future<void> addRecipe(Recipe recipe) {
    return _collectionReference.add((recipe.toMap()));
  }

  Future<void> updateRecipe(Recipe recipe) {
    return _collectionReference.doc(recipe.title).update((recipe.toMap()));
  }

  Future<void> deleteRecipe(String recipetitle) {
    return _collectionReference.doc(recipetitle).delete();
  }
}


