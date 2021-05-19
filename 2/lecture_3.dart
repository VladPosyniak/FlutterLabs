import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Instagram',
            style: const TextStyle(
                fontFamily: "Billabong", color: Colors.black, fontSize: 25.0)),
        backgroundColor: Colors.white,
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.chat),
              color: Colors.black,
              onPressed: () {
                print('open comments');
              },
            )
          ]
      ),
      body: new Container(
        child: new PostBox(),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new DrawerHeader(
              child: new Text("Drawer Header"),
              decoration: new BoxDecoration(
                color: Colors.blue,
              ),
            ),
            new Text("Place for make photo"),
          ],
        ),
      ),
      bottomNavigationBar: new BottomNavigationBar(items: [
        new BottomNavigationBarItem(
          icon: new Icon(Icons.home, color: Colors.black,),
          label: "Home",
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.search),
          label: 'Search',
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.photo),
          label: 'Create',
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.account_circle),
          label: 'Profile',
        )
      ],
      unselectedItemColor: Colors.black,
        showUnselectedLabels: false,
        showSelectedLabels: false,
      ),
    );
  }
}

class PostBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(children:  getPosts());
  }


  List<Widget> getPosts() {
    List<Widget> postList = [];
    for (int i = 1; i < 10; i++) {
      postList.add(new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pinimg.com/564x/4d/25/73/4d2573613020f2d11b0f662a55a2c3a0.jpg'),
              backgroundColor: Colors.grey,
            ),
            title: GestureDetector(
              child: Text('Alina', style: new TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,)),
              onTap: () {
                print('Open profile');
              },
            ),
            subtitle: Text('Sri lanka'),
            trailing: const Icon(Icons.more_vert),
          ),
          new GestureDetector(
            onDoubleTap: () => {print('Post liked')},
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.network(
                  'https://ak-d.tripcdn.com/images/100i1f000001gp4o36FC4_C_750_500.jpg?proc=source%2Ftrip',
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(padding: const EdgeInsets.only(left: 20.0, top: 40.0)),
              GestureDetector(
                  child: const Icon(
                    Icons.favorite_outline,
                    size: 25.0,
                  ),
                  onTap: () {
                    print('Like');
                  }),
              Padding(padding: const EdgeInsets.only(right: 20.0)),
              GestureDetector(
                  child: const Icon(
                    Icons.comment,
                    size: 25.0,
                  ),
                  onTap: () {
                    print('Go to comment');
                  }),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "5 likes",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Alina ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Expanded(child: Text('Best sunset i ever seen')),
            ],
          )
        ],
      )
      );
    }

    return postList;
  }
}


void main() {
  runApp(
      new MaterialApp(debugShowCheckedModeBanner: false, home: new MainPage()));
}
