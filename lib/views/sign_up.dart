import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import 'package:hello_world/constants/routes.dart';


class sign_up extends StatefulWidget {
  const sign_up({super.key});

  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              TextField(
                controller: _email,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    icon: Icon(Icons.mail), hintText: "Email"),
              ),
              TextField(
                controller: _password,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                    icon: Icon(Icons.lock), hintText: "Password"),
              ),
              ElevatedButton(
                  onPressed: () async {
                    final email = _email.text;
                    final password = _password.text;
                    try {
                      final UserCredential = FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: email, password: password);
                      devtools.log(UserCredential.toString());
                     Navigator.of(context).pushNamedAndRemoveUntil(
                        '/verify/', (route) => false);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        devtools.log("Password is weak");
                      } else if (e.code == 'email-already-in-use') {
                       devtools.log('Email is already in use');
                      } else if (e.code == 'invalid-email') {
                        devtools.log('Invalid email entered');
                      }
                    }
                  },
                  child: const Text('SIGN UP')),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    loginRoute,
                    (route) => false,
                  );
                },
                child: const Text("Have an account?"),
              ),
            ])));
  }
}
