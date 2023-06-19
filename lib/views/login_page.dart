import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_world/views/sign_up.dart';

import '../firebase_options.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                                .signInWithEmailAndPassword(
                                    email: email, password: password);
                            print(UserCredential);
                          } 
                          on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print("User  not found");
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password');
                            }
                          }
                        },
                        child: const Text('LOG IN')),
                    RichText(
                        text: TextSpan(
                            text: "Don\'t have an account?",
                            style: const TextStyle(color: Colors.black, fontSize: 20),
                            children: [
                          TextSpan(
                              text: " Create",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(() => const sign_up())),
                        ]))
                  ]));
            }));
  }
}
