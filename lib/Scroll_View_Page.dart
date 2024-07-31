import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ScrollViewPage extends StatefulWidget
{
  const ScrollViewPage({super.key});

  @override
  State<ScrollViewPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ScrollViewPage>
{
  final _url = "https://jsonplaceholder.typicode.com/albums";
  final int _limit = 20;
  late ScrollController _controller;
  List _albumList = [];
  int _page = 1;
  bool _isLoading = false;
  bool _hasMoreData = true;
  bool _isFirstLoad = false;


  @override
  void initState()
  {
    super.initState();
    initLoad();
    _controller = ScrollController()..addListener(_nextLoad);
  }

  void initLoad() async
  {
    setState(() {
      _isFirstLoad = true;
    });
    try
    {
      final res = await http.get(Uri.parse("$_url?_page=$_page&_limit=$_limit"));
      setState(() {
        _albumList = jsonDecode(res.body);
      });
    }
    catch(e)
    {
      print(e.toString());
    }
    setState(() {
      _isFirstLoad = false;
    });
  }

  void _nextLoad() async
  {
    print("nextLoad");
    if(_hasMoreData && !_isFirstLoad && !_isLoading && _controller.position.extentAfter < 100)
    {
      setState(() {
        _isLoading = true;
      });
      _page += 1;
      try
      {
        final res = await http.get(Uri.parse("$_url?_page=$_page&_limit=$_limit"));
        final List fetchedAlbums = jsonDecode(res.body);
        if(fetchedAlbums.isNotEmpty)
        {
          setState(() {
            _albumList.addAll(fetchedAlbums);
          });
        }
        else
        {
          setState(() {
            _hasMoreData = false;
          });
        }
      }
      catch(e)
      {
        print(e.toString());
      }
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose()
  {
    super.dispose();
    _controller.removeListener(_nextLoad);
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar
          (
          title: const Text("test title"),
        ),
        body: _isFirstLoad ? const Center (child: CircularProgressIndicator(),)
            : Column
          (
          children:
          [
            Expanded
              (
                child: ListView.builder
                  (
                    controller: _controller,
                    itemCount: _albumList.length,
                    itemBuilder: (context, index) => Card
                      (
                      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      child: ListTile
                        (
                        title: Text(_albumList[index]["id"].toString()),
                        subtitle: Text(_albumList[index]["title"]),
                      ),
                    )
                )
            ),
            if (_isLoading == true)
              (
                  Container
                    (
                    padding: const EdgeInsets.all(30),
                    child: const Center
                      (
                      child: CircularProgressIndicator(),
                    ),
                  )
              ),
            if (_hasMoreData == false)
              (
                  Container
                    (
                    padding: const EdgeInsets.all(20),
                    child: const Center
                      (
                      child: Text
                        (
                        "No more data to be fetched",
                        style: TextStyle
                          (
                            color: Colors.white
                        ),
                      ),
                    ),
                  )
              )
          ],
        )
    );
  }
}