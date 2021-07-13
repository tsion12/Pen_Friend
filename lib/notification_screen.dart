import 'package:flutter/material.dart';
import 'package:pen_friend_android/constants.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScreenbgColor,
      appBar: AppBar(
        backgroundColor: kScreenbgColor,
        leading: Icon(
          Icons.notifications,
          size: 40,
        ),
        title: Text(
          'Notifications',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: NotificatonScreen(),
    );
  }
}

class NotificatonScreen extends StatefulWidget {
  const NotificatonScreen({Key key}) : super(key: key);

  @override
  _NotificatonScreenState createState() => _NotificatonScreenState();
}

class _NotificatonScreenState extends State<NotificatonScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                tileColor: Theme.of(context).primaryColor,
                leading: kcircleAvater,
                title: Text(
                  'Pen Name: Supported your post',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                subtitle: Text(
                  'Three hours ago',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                trailing: TextButton(
                  child: Text(
                    'View Post',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
