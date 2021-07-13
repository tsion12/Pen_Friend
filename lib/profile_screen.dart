import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pen_friend_android/constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScreenbgColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.transparent,
      ),
      body: ProfilePageScreen(),
    );
  }
}

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({Key key}) : super(key: key);

  @override
  _ProfilePageScreenState createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      scrollDirection: Axis.vertical,
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: SizedBox(
                width: 100,
                height: 100,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image(
                    width: 60,
                    image: AssetImage('images/brownlady.png'),
                  ),
                ),
              ),
            ),
            Text(
              'Pen Name',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Hey There! I am ready to get know you!',
              style: TextStyle(color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.people,
                  color: Colors.white,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text('4 Mentees',
                        style: TextStyle(color: Colors.white))),
                SizedBox(
                  height: 20,
                  child: VerticalDivider(
                    color: Colors.white12,
                    thickness: 1,
                  ),
                ),
                Icon(
                  Icons.people,
                  color: Colors.white,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      '4 Mentees',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
            SizedBox(
              height: 50,
              width: 120,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Mentor Me',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.transparent, shape: StadiumBorder()),
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.work,
                  color: Colors.white70,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Software Engineer',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.date_range,
                  color: Colors.white70,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Date of birth, May 12,1998',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.more_horiz,
                  color: Colors.white70,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'I am a positive person!',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ReusableListTile(
              text: 'POSTS',
            ),
            SizedBox(
              height: 20,
            ),
            ReusableListTile(
              text: 'BOOKS',
            ),
            SizedBox(
              height: 20,
            ),
            ReusableListTile(
              text: 'PLACES',
            ),
            SizedBox(
              height: 20,
            ),
            ReusableListTile(
              text: 'MOVIES',
            ),
            SizedBox(
              height: 20,
            ),
            ReusableListTile(
              text: 'HOBBY',
            ),
            SizedBox(
              height: 20,
            ),
            ReusableListTile(
              text: 'MY FUTURE',
            ),
          ],
        )
      ],
    );
  }
}

class ReusableListTile extends StatelessWidget {
  const ReusableListTile({this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
          ),
          SizedBox(
            height: 40,
            width: 100,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Discover',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, shape: StadiumBorder()),
            ),
          ),
        ],
      ),
    );
  }
}
