import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:hello_world/views/login_page.dart';

import '../firebase_options.dart';

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

  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
            future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform,
            ),
            builder: (context, snapshot) {
              return Padding(
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
                          print(UserCredential);
                          // Navigator.push(context, MaterialPageRoute(builder: (context) =>Login_page()))
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print("Password is weak");
                          } else if (e.code == 'email-already-in-use') {
                            print('Email is already in use');
                          } else if (e.code == 'invalid-email') {
                            print('Invalid email entered');
                          }
                        }
                      },
                      child: const Text('SIGN UP')),
                  const SizedBox(
                    height: 15,
                  ),
                  RichText(
                      text: TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                ),
                          text: "Have an account?",
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black)))
                ]),
              );
            }));
  }
}
