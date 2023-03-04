import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/screens/AddRecipe.dart';
import 'package:flutter_application_1/screens/DeleteRecipe.dart';
import 'package:flutter_application_1/screens/Login.dart';
import 'package:flutter_application_1/screens/RecipeDetails.dart';
import 'package:flutter_application_1/screens/UpdateRecipe.dart';

class NewHome extends StatelessWidget {
  final User? user;

  const NewHome(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Home"),
      ),
      body: Column(children: [
        Text("welcome, ${user!.email}"),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
            onPressed: () {
              final navigator = Navigator.of(context);

              navigator.pushReplacement(
                  MaterialPageRoute(builder: (context) => const AddRecipe()));
            },
            child: const Text("Add Recipe")),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
            onPressed: () {
              final navigator = Navigator.of(context);

              navigator.pushReplacement(MaterialPageRoute(
                  builder: (context) => const RecipeDetails()));
            },
            child: const Text("View Recipes")),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
            onPressed: () {
              final navigator = Navigator.of(context);

              navigator.pushReplacement(MaterialPageRoute(
                  builder: (context) => const DeleteRecipe()));
            },
            child: const Text("Delete Recipe")),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
            onPressed: () {
              final navigator = Navigator.of(context);

              navigator.pushReplacement(MaterialPageRoute(
                  builder: (context) => const UpdateRecipe()));
            },
            child: const Text("Update Recipe")),
        const SizedBox(
          height: 50,
        ),
        ElevatedButton(
            onPressed: () async {
              final navigator = Navigator.of(context);
              await FirebaseAuth.instance.signOut();

              navigator.pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            child: const Text("Log Out")),
      ]),
    );
  }
}
