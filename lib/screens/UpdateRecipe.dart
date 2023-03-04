import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/models/Recipe.model.dart';
import 'package:flutter_application_1/repositories/RecipeRepository.dart';
import 'package:flutter_application_1/screens/RecipeUpdateForm.dart';

class UpdateRecipe extends StatefulWidget {
  const UpdateRecipe({super.key});

  @override
  State<UpdateRecipe> createState() => _UpdateRecipeState();
}

class _UpdateRecipeState extends State<UpdateRecipe> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('recipes').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          return Column(
            children: [
              const Text(
                "Tap on an entry to Update",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Material(
                child: ListView(
                    shrinkWrap: true,
                    children: snapshot.data!.docs.map((doc) {
                      return ListTile(
                        title: Text(doc['title']),
                        onTap: () {
                          final navigator = Navigator.of(context);

                          navigator.pushReplacement(MaterialPageRoute(
                              builder: (context) => const RecipeUpdateForm()));
                        },
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Description : ${doc['description']}"),
                            Text("Ingredients : ${doc['ingredients']}")
                          ],
                        ),
                      );
                    }).toList()),
              ),
            ],
          );
        });
    ;
  }
}
