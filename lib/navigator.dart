import 'package:chdndds/second_view.dart';
import 'package:flutter/material.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NavigatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("네비게이터 화면"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (_) => SecondViewpage())
          ),
          child: Container(
            padding: EdgeInsets.all(15),
            color: Colors.blue,
            child: Text("Get Started"),
          ),
        ),
      ),
    );
  }
}