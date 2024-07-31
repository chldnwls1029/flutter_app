import 'package:flutter/material.dart';

void main() {
  runApp(const AlertPage());
}

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  get builder => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("alert 입니다"),
      ),
      body: Container(
        child: Center(
          child: TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext con) {
                    return AlertDialog(
                      title: const Text("Dialog Title"),
                      content: Container(
                        child: const Text("Dialog Content"),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text("Close"))
                      ],
                    );
                  });
            },
            child: const Text("팝업 버튼"),
          ),
        ),
      ),
    );
  }
}
