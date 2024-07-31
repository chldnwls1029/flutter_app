import 'package:flutter/material.dart';


class SecondViewpage extends StatefulWidget {
  const SecondViewpage({super.key});

  @override
  State<SecondViewpage> createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondViewpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          color: Colors.blue,
          child: Text("여기는 두번째 페이지입니다."),
        ),
      ),
    );
  }
}