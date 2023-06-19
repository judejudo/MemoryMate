import 'package:flutter/material.dart';

class logout_page extends StatefulWidget {
  const logout_page({super.key});

  @override
  State<logout_page> createState() => _logout_pageState();
}

class _logout_pageState extends State<logout_page> {
@override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(children: [
            const TextField(
              decoration: InputDecoration(icon: Icon(Icons.mail)),
            ),
            ElevatedButton( 
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) =>Login_page()))
                    },
                    child: Text('LOG OUT')),
          ]),
        ));
  }
}