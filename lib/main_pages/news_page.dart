import 'package:flutter/material.dart';
import '../components/bottom_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:all_log/welcome_pages/welcome_page.dart';
import 'package:all_log/components/constants.dart';

class NewsPage extends StatefulWidget {
  static String id = 'news_page';

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<Widget> lateNews = [
    NewsPiece(
      title: 'Brand News!',
      text: 'Some late news',
      icon: Icons.accessibility_outlined,
    ),
    NewsPiece(
      title: 'Brand News!',
      text: 'One more late news',
      icon: Icons.accessibility_outlined,
    ),
  ];
  String currentNewsType = 'Late News';

  List<Widget> logisticsNews = [
    NewsPiece(
      title: 'Logistics News!',
      text: 'Some Logistics news',
      icon: Icons.accessibility_outlined,
    ),
    NewsPiece(
      title: 'Logistics News!',
      text: 'One more Logistics news',
      icon: Icons.accessibility_outlined,
    ),
  ];

  List<Widget> politicNews = [
    NewsPiece(
      title: 'Politic News!',
      text: 'Some Politic news',
      icon: Icons.accessibility_outlined,
    ),
    NewsPiece(
      title: 'Politic News!',
      text: 'One more Politic news',
      icon: Icons.accessibility_outlined,
    ),
  ];

  List<Widget> economyNews = [
    NewsPiece(
      title: 'Economy News!',
      text: 'Some Economy news',
      icon: Icons.accessibility_outlined,
    ),
    NewsPiece(
      title: 'Economy News!',
      text: 'One more Economy news',
      icon: Icons.accessibility_outlined,
    ),
  ];

  List<Widget> fairNews = [
    NewsPiece(
      title: 'Fair News!',
      text: 'Some Fair news',
      icon: Icons.accessibility_outlined,
    ),
    NewsPiece(
      title: 'Fair News!',
      text: 'One more Fair news',
      icon: Icons.accessibility_outlined,
    ),
  ];

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.pushNamed(context, WelcomePage.id);
            },
            icon: Icon(Icons.logout),
          ),
        ],
        title: Text('News Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 30.0,
            color: Colors.white,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                NewsType(
                  title: 'Последние новости',
                  onPressed: () {
                    setState(() {
                      currentNewsType = 'Late News';
                    });
                  },
                ),
                SizedBox(
                  width: 20.0,
                ),
                NewsType(
                  title: 'Логистика',
                  onPressed: () {
                    setState(() {
                      currentNewsType = 'Logistics News';
                    });
                  },
                ),
                SizedBox(
                  width: 20.0,
                ),
                NewsType(
                  title: 'Политика',
                  onPressed: () {
                    setState(() {
                      currentNewsType = 'Politic News';
                    });
                  },
                ),
                SizedBox(
                  width: 20.0,
                ),
                NewsType(
                  title: 'Экономика',
                  onPressed: () {
                    setState(() {
                      currentNewsType = 'Economy News';
                    });
                  },
                ),
                SizedBox(
                  width: 20.0,
                ),
                NewsType(
                  title: 'Популярное',
                  onPressed: () {
                    setState(() {
                      currentNewsType = 'Fire News';
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: ListView.builder(
                itemCount: lateNews.length,
                itemBuilder: (BuildContext context, int index) {
                  if (currentNewsType == 'Late News') {
                    return lateNews[index];
                  } else if (currentNewsType == 'Logistics News') {
                    return logisticsNews[index];
                  } else if (currentNewsType == 'Politic News') {
                    return politicNews[index];
                  } else if (currentNewsType == 'Economy News') {
                    return economyNews[index];
                  } else if (currentNewsType == 'Fire News') {
                    return fairNews[index];
                  } else {
                    return lateNews[index];
                  }
                },
              ),
            ),
          ),
          BottomPanelWidget(),
        ],
      ),
    );
  }
}

class NewsPiece extends StatelessWidget {
  NewsPiece({required this.title, required this.icon, required this.text});

  final String title;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      color: Colors.orangeAccent,
      child: Row(
        children: [
          Icon(
            icon,
            size: 100.0,
          ),
          SizedBox(
            width: 40.0,
          ),
          Column(
            children: [
              Text(
                title,
                style: kOrderTitleTextStyle,
              ),
              Text(
                text,
                style: kOrderTitleTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NewsType extends StatelessWidget {
  NewsType({required this.title, required this.onPressed});

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        child: GestureDetector(
          onTap: onPressed,
          child: Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 15.0),
          ),
        ),
      ),
    );
  }
}
