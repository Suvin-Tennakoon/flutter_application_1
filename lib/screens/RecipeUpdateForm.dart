import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/models/Recipe.model.dart';
import 'package:flutter_application_1/repositories/RecipeRepository.dart';

class RecipeUpdateForm extends StatefulWidget {
  const RecipeUpdateForm({super.key});

  @override
  State<RecipeUpdateForm> createState() => _RecipeUpdateFormState();
}

class _RecipeUpdateFormState extends State<RecipeUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;
  late List<String> _ingredients;

  @override
  void initState() {
    super.initState();
    _title = '';
    _description = '';
    _ingredients = [];
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Title",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter the recipe title";
                }

                return null;
              },
              onChanged: (value) {
                setState(() {
                  _title = value;
                });
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Description",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter the recipe description";
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  _description = value;
                });
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Recipe recipe = Recipe(_title, _description, _ingredients);
                    RecipeRepository recipeRepository = RecipeRepository();
                    recipeRepository.addRecipe(recipe);

                    setState(() {
                      _title = '';
                      _description = '';
                      _ingredients = [];
                    });
                  }
                },
                child: const Text("Add Recipe")),
            
          ],
        ),
      ),
    );
    ;
  }
}