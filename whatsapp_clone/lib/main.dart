import 'package:flutter/material.dart';
import 'chats.dart';

const APP_NAME = "WhatsApp";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_NAME,
      theme: ThemeData(
        primaryColor: Color(0xff075E54),
        accentColor: Color(0xff25D366),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _textPage(String txt) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        txt,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.photo_camera)),
              Tab(text: "CHATS"),
              Tab(text: "STATUS"),
              Tab(text: "CALLS"),
            ],
          ),
          title: Text(APP_NAME),
          actions: <Widget>[
            Icon(
              Icons.search,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(
                Icons.more_vert,
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            ChatsRoute(),
            _textPage("STATUS"),
            _textPage("CALLS"),
          ],
        ),
        floatingActionButton: _floatingActionButton(context),
      ),
    );
  }

  Widget _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).accentColor,
      onPressed: null,
      child: Icon(
        Icons.message,
        color: Colors.white,
      ),
    );
  }
}
