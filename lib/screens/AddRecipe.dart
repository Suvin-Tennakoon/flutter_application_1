import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/models/Recipe.model.dart';
import 'package:flutter_application_1/repositories/RecipeRepository.dart';
import 'package:flutter_application_1/screens/Login.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({super.key});

  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;
  late List<String> _ingredients;

  String _ingr = '';

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
            Expanded(
              child: TextFormField(
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
            ),
            const SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: TextFormField(
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
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(hintText: "Ingredients"),
                    onChanged: (value) {
                      setState(() {
                        _ingr = value;
                      });
                    },
                  ),
                ),
                IconButton(
                    onPressed: () {
                      _ingredients.add(_ingr);
                      setState(() {
                        
                      });
                    },
                    icon: const Icon(Icons.add))
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(_ingredients.toString()),
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
