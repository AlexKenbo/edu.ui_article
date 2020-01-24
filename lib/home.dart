import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  //Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _controller =
        TabController(length: 4, initialIndex: 0, vsync: this);
    return Scaffold(
      backgroundColor: Color(0xFF1f2f6),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(color: Colors.grey.withOpacity(.3))),
              ),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                              color: Color(0xFF1f2f6),
                              borderRadius: BorderRadius.circular(8)),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              prefixIcon: Icon(Icons.search),
                              //border: InputBorder.none
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 32,
                        ),
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 0.2,
                                  offset: Offset(0, 1),
                                  blurRadius: 2,
                                )
                              ],
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFfe4061),
                                    Color(0xFFfe7c68),
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight)),
                          child: Icon(Icons.add, color: Colors.white, size: 36),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    TabBar(
                      controller: _controller,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      indicatorWeight: 0.1,
                      labelStyle: TextStyle(fontSize: 18),
                      tabs: <Widget>[
                        Tab(
                          text: 'For you',
                        ),
                        Tab(
                          text: 'Editor picks',
                        ),
                        Tab(
                          text: 'Top stories',
                        ),
                        Tab(
                          text: 'Bookmarks',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      height: 222,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          storyCard(true, 'assets/person1.jpg'),
                          storyCard(false, 'assets/person2.jpg'),
                          storyCard(true, 'assets/person3.jpg'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.only(top: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(color: Colors.grey.withOpacity(.3))),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Most Popular',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Row(
                          children: <Widget>[
                            Text('Show all',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.red,
                                    width: 2
                                  )
                              ),
                              child: Icon(Icons.chevron_right, color: Colors.red,),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 12,),
                    Container(
                      height: 400,
                      child: GridView.count(
                        crossAxisCount: 2,
                        padding: EdgeInsets.all(12),
                        mainAxisSpacing: 13,
                        children: List.generate(posts.length, (index) => gridCard(posts[index])),

                      ),
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white.withOpacity(.7),
        selectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), title: Text('Likes')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Account')),

        ],
      ),
    );
  }
}

Widget storyCard(bool f, String imag) {
  return Container(
    margin: EdgeInsets.only(right: 12),
    child: Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imag,
            width: 170,
            height: 222,
            fit: BoxFit.cover,
          ),
        ),
        f
            ? Positioned(
                right: 12,
                top: 12,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child:
                        Text('Featured', style: TextStyle(color: Colors.white)),
                  ),
                ),
              )
            : Container(),
        Positioned(
          bottom: 12,
          left: 12,
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('assets/user.png'),
              ),
              SizedBox(
                width: 12,
              ),
              Text('Hussein Ahmed Al-Ghazi',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.white))
            ],
          ),
        )
      ],
    ),
  );
}

Widget gridCard(Post p){
  return Container(
    margin: EdgeInsets.only(right: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(p.image, width: 180, height: 169, fit: BoxFit.cover,),
          ),
        ),
        SizedBox(height: 5,),
        Text(p.timeAge, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 17),),
        

      ],
    ),
  );
}

List<Post> posts = [
  const Post(image: 'assets/person1.jpg', title: 'mohamed', timeAge: 'yesterday'),
  const Post(image: 'assets/person2.jpg', title: 'friend', timeAge: 'wekk'),
  const Post(image: 'assets/person3.jpg', title: 'awesome', timeAge: '21 min'),
  const Post(image: 'assets/nature.jpg', title: 'yassine', timeAge: '2 day'),

];

class Post{
  final String image, title, timeAge;
  const Post({this.image, this.title, this.timeAge});
}