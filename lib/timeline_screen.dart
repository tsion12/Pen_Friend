import 'package:flutter/material.dart';
import 'package:pen_friend_android/constants.dart';
import 'search_screen.dart';

class Timeline extends StatefulWidget {
  const Timeline({Key key}) : super(key: key);

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScreenbgColor,
      appBar: AppBar(
        backgroundColor: kScreenbgColor,
        leading: Image(
          width: 25,
          image: AssetImage('images/logo.png'),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'search');
            },
          ),
          SizedBox(
            width: 30,
          ),
          Icon(Icons.chat_outlined),
          SizedBox(
            width: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: kcircleAvater,
          ),
        ],
      ),
      body: TimelineScreen(),
    );
  }
}

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({Key key}) : super(key: key);

  @override
  _TimelineScreenState createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  Widget _shareOption() {
    return Column(
      children: [
        Column(
          children: [
            Row(
              children: [
                kcircleAvater,
                SizedBox(
                  width: 15,
                ),
                Container(
                    width: 250,
                    decoration: BoxDecoration(
                        color: Color(0xff6D4C41),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Center(
                        child: Text(
                          'Anything you wanna share?',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent, shape: StadiumBorder()),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.photo_camera),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Pictures')
                        ],
                      )),
                ),
                SizedBox(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent, shape: StadiumBorder()),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.pending),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Thoughts')
                        ],
                      )),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _menteesAvatar() {
    return SizedBox(
      height: 150,
      child: ListView(
        padding: EdgeInsets.only(top: 10),
        scrollDirection: Axis.horizontal,
        children: [
          Column(
            children: [
              ProfileAvatars(
                onTap: () {
                  Navigator.pushNamed(context, 'profile');
                },
                image: Image(
                  image: AssetImage('images/greenboyavatar.jpg'),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Pen Name',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              ProfileAvatars(
                image: Image(
                  image: AssetImage('images/suitguy.jpg'),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Pen Name',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
          Column(
            children: [
              ProfileAvatars(
                image: Image(
                  image: AssetImage('images/greenboyavatar.jpg'),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Pen Name',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              ProfileAvatars(
                image: Image(
                  image: AssetImage('images/suitguy.jpg'),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Pen Name',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              ProfileAvatars(
                image: Image(
                  image: AssetImage('images/greenboyavatar.jpg'),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Pen Name',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      scrollDirection: Axis.vertical,
      children: [
        Column(
          children: [
            _shareOption(),
            _menteesAvatar(),
            Card(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        kcircleAvater,
                        Column(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Pen Name',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ],
                        ),
                        SizedBox(
                          width: 220,
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        )
                      ],
                    ),
                    Container(
                      height: 180,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage('images/learn.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Text(
                      'Let Your Failure Be Your Teacher',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    Wrap(
                      children: [
                        Text(
                          'I get it mistakes happen.And while it may be tempting to keep it secret and silently move forward, sometimes there is more value in sharing your failures than just sweeping them under the rug.',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Continue reading..',
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.favorite_border,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.comment_bank_outlined,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.share,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class ProfileAvatars extends StatelessWidget {
  const ProfileAvatars({this.image, this.onTap});
  final Image image;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: Container(
          height: 70.0,
          width: 70.0,
          color: Colors.transparent,
          child: image,
        ),
      ),
    );
  }
}
