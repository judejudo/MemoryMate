import 'package:flutter/material.dart';
import 'package:hello_world/views/login_page.dart';
import 'package:hello_world/views/sign_up.dart';


class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: w,
                    height: h * 0.3,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("img/logo.png"),
                            fit: BoxFit.cover))),
                Container(
                    width: w * 0.9,
                    height: h * 0.3,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("img/Doodles_Reading.png")))),
                const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 65.0),
                        child: Text(
                          "Welcome to MemoryMate!",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "Retain book knolwedge for lasting wisdom",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      )
                    ]),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const LoginPage()));
                    },
                    child: const Text('LOGIN')),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const sign_up()));
                  },
                  child: const Text('SIGN UP'),
                )
              ]),
        ));
  }
}
