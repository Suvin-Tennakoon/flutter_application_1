import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/screens/newhome.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _error = '';

  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);

      if (mounted) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => NewHome(userCredential.user)));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _error = e.message!;
      });
    }
  }

  Future<void> _register() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);

      if (mounted) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => NewHome(userCredential.user)));
      }
    } on FirebaseAuthException catch (e) {
      _error = e.message!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
      
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
          
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
          
            const SizedBox(height: 16,),
          
            ElevatedButton(onPressed: _login, child: const Text("Sign In")),
      
            const SizedBox(height: 16.0,),
          
            ElevatedButton(onPressed: _register, child: const Text("Sign Up")),
          
            Text(
              _error,
              style: const TextStyle(color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}
