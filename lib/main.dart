import 'package:clone_whatsapp/call_screen.dart';
import 'package:clone_whatsapp/camera_screen.dart';
import 'package:clone_whatsapp/chat_screen.dart';
import 'package:clone_whatsapp/status_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App2(),
    );
  }
}

class App2 extends StatefulWidget {
  @override
  _App2State createState() => _App2State();
}

class _App2State extends State<App2> with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool showFab = true;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, initialIndex: 1, length: 4);
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        showFab = true;
      } else {
        showFab = false;
      }
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp'),
       // toolbarHeight: 100,
        elevation: 0.7,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[

            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: 'CHATS'),
            Tab(text: 'STATUS'),
            Tab(text: 'CALLS'),

          ],
        ),
        actions: <Widget>[
          Icon(Icons.search),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
          ),
          Icon(Icons.more_vert)
        ],
      ),

      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Callscreen(),
          Camerascreen(),
          Chatscreen(),
          Statusscreen(),

          
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
      ),


    );

  }
}
