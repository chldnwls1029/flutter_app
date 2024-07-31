import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget
{
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin
{
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState()
  {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener
      (
            () => setState(() {
          _selectedIndex = _tabController.index;
        })
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar
          (
          title: const Text("네비게이션 페이지"),
        ),
        body: _selectedIndex == 0 ?
        tabContainer(context, Colors.cyan, "Friends tab")
            : _selectedIndex == 1 ? tabContainer(context, Colors.indigo, "Chats tab")
            : tabContainer(context, Colors.deepPurpleAccent, "Settings tab"),
        bottomNavigationBar: SizedBox
          (
          height: 60,
          child: TabBar
            (
            controller: _tabController,
            labelColor: Colors.black,
            tabs:
            const [
              Tab
                (
                  icon: Icon(Icons.people),
                  text: "Friends"
              ),
              Tab
                (
                  icon: Icon(Icons.chat),
                  text: "Chats"
              ),
              Tab
                (
                  icon: Icon(Icons.settings),
                  text: "Settings"
              )
            ],
          ),
        )
    );
  }

  Widget tabContainer(BuildContext con, Color tabColor, String tabText)
  {
    return Container
      (
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: tabColor,
      child: Center
        (
        child: Text
          (
            tabText,
            style: const TextStyle
              (
                color: Colors.white
            )
        ),
      ),
    );
  }
}