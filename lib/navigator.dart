import 'package:flutter/material.dart';
import 'package:flutter_app/second_view.dart';


class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("네비게이터 화면"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (_) => SecondView())
          ),
          child: Container(
            padding: EdgeInsets.all(15),
            color: Colors.blue,
            child: Text("Get started"),
          ),
        ),
      ),
    );
  }
}