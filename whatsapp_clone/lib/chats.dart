import 'package:flutter/material.dart';
import 'chat_model.dart';

class ChatsRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatsRouteState();
}

class ChatsRouteState extends State<ChatsRoute> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (BuildContext context, int i) {
        return Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(dummyData[i].avatarUrl),
              ),
              title: Text(dummyData[i].name),
              subtitle: Text(dummyData[i].message),
              trailing: Text(dummyData[i].time),
            ),
            Divider(
              height: 10.0,
            ),
          ],
        );
      },
    );
  }
}
