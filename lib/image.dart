import 'package:flutter/material.dart';


class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('이미지 앱 바입니다.'),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network('https://flutter.dev/images/flutter-logo-sharing.png')
        )
    );
  }
}