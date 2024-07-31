import 'package:flutter/material.dart';
class MyFirstPage extends StatefulWidget {
  const MyFirstPage({super.key});

  @override
  State<MyFirstPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("안녕하세요222"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            ListTile(
              title: Text("Menu 1"),
            ),
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text("Drawer Header Part"))
          ],
        ),
      ),
      body: const Center(child: Text("HELLO WORLD")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("click click"),
        child: const Icon(Icons.mouse),
      ),
    );
  }
}