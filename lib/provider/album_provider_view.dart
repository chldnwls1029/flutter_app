import 'package:flutter/material.dart';

import '../model/album.dart';
import 'album_provider.dart';
import 'package:provider/provider.dart';


class AlbumProviderViewPage extends StatefulWidget {
  const AlbumProviderViewPage({super.key});

  @override
  State<AlbumProviderViewPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AlbumProviderViewPage> {

  late List<Album> albumList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AlbumProvider>(
      create: ((context) => AlbumProvider()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("test title"),
        ),
        body: Consumer<AlbumProvider>(
          builder: (context, provider, child) {
            albumList = provider.getAlbumList();
            return ListView.builder(
                itemCount: albumList.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    child: Text("${albumList[index].id} : ${albumList[index].title}"),
                  );
                }
            );
          },
        ),
      ),
    );
  }
}