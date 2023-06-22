// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'dart:developer' as devtools show log;

// import 'package:hello_world/constants/routes.dart';
// import 'package:hello_world/utilities/show_error_dialog.dart';

// class sign_up extends StatefulWidget {
//   const sign_up({super.key});

//   @override
//   State<sign_up> createState() => _sign_upState();
// }

// class _sign_upState extends State<sign_up> {
//   late final TextEditingController _email;
//   late final TextEditingController _password;

//   @override
//   void initState() {
//     _email = TextEditingController();
//     _password = TextEditingController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _email.dispose();
//     _password.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(children: [
//               TextField(
//                 controller: _email,
//                 enableSuggestions: false,
//                 autocorrect: false,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: const InputDecoration(
//                     icon: Icon(Icons.mail), hintText: "Email"),
//               ),
//               TextField(
//                 controller: _password,
//                 obscureText: true,
//                 enableSuggestions: false,
//                 autocorrect: false,
//                 decoration: const InputDecoration(
//                     icon: Icon(Icons.lock), hintText: "Password"),
//               ),
//               ElevatedButton(
//                   onPressed: () async {
//                     final email = _email.text;
//                     final password = _password.text;
//                     try {
//                       final UserCredential = FirebaseAuth.instance
//                           .createUserWithEmailAndPassword(
//                               email: email, password: password);
//                       final user = FirebaseAuth.instance.currentUser;
//                       await user?.sendEmailVerification();
//                       Navigator.of(context).pushNamed(verifyEmailRoute);
//                     } on FirebaseAuthException catch (e) {
//                       if (e.code == 'weak-password') {
//                         await showErrorDialog(context, 'Week password');
//                         devtools.log("Password is weak");
//                       } else if (e.code == 'email-already-in-use') {
//                         await showErrorDialog(
//                             context, 'Email is already in use');
//                         devtools.log('Email is already in use');
//                       } else if (e.code == 'invalid-email') {
//                         await showErrorDialog(context, 'Invalid Email');
//                         devtools.log('Invalid email entered');
//                       } else {
//                         await showErrorDialog(
//                           context,
//                           'Error ${e.code}',
//                         );
//                       }
//                     } catch (e) {
//                       await showErrorDialog(context, e.toString());
//                     }
//                   },
//                   child: const Text('SIGN UP')),
//               const SizedBox(
//                 height: 15,
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pushNamedAndRemoveUntil(
//                     loginRoute,
//                     (route) => false,
//                   );
//                 },
//                 child: const Text("Have an account?"),
//               ),
//             ])));
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import 'package:hello_world/constants/routes.dart';
import 'package:hello_world/utilities/show_error_dialog.dart';

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
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'MemoryMate',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: _email,
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: _password,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: const TextField(
                    // controller: _password,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: ' Confirm Password',
                    ),
                  ),
                ),
                SizedBox( height: 20),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                        child: const Text('Sign Up'),
                        onPressed: () async {
                          final email = _email.text;
                          final password = _password.text;
                          try {
                            final UserCredential = FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: email, password: password);
                            final user = FirebaseAuth.instance.currentUser;
                            await user?.sendEmailVerification();
                            Navigator.of(context).pushNamed(verifyEmailRoute);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              await showErrorDialog(context, 'Weak password');
                              devtools.log("Password is weak");
                            } else if (e.code == 'email-already-in-use') {
                              await showErrorDialog(
                                  context, 'Email is already in use');
                              devtools.log('Email is already in use');
                            } else if (e.code == 'invalid-email') {
                              await showErrorDialog(context, 'Invalid Email');
                              devtools.log('Invalid email entered');
                            } else {
                              await showErrorDialog(
                                context,
                                'Error ${e.code}',
                              );
                            }
                          } catch (e) {
                            await showErrorDialog(context, e.toString());
                          }
                        })),
                Row(
                  children: <Widget>[
                    TextButton(
                      child: const Text(
                        'Have an account?',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
              
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          loginRoute,
                          (route) => false,
                        );
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            )));
  }
}
