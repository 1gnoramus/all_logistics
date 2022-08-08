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
  List<Widget> currentNewsType = [];

  List<NewsPiece> lateNews = [
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

  List<NewsPiece> logisticsNews = [
    NewsPiece(
      title: 'Logistics News!',
      text: 'Some Logistics news',
      icon: Icons.car_crash_outlined,
    ),
    NewsPiece(
      title: 'Logistics News!',
      text: 'One more Logistics news',
      icon: Icons.car_crash_outlined,
    ),
  ];

  List<NewsPiece> politicNews = [
    NewsPiece(
      title: 'Politic News!',
      text: 'Some Politic news',
      icon: Icons.local_police_outlined,
    ),
    NewsPiece(
      title: 'Politic News!',
      text: 'One more Politic news',
      icon: Icons.local_police_outlined,
    ),
  ];

  List<NewsPiece> economyNews = [
    NewsPiece(
      title: 'Economy News!',
      text: 'Some Economy news',
      icon: Icons.auto_graph_rounded,
    ),
    NewsPiece(
      title: 'Economy News!',
      text: 'One more Economy news',
      icon: Icons.auto_graph_rounded,
    ),
  ];

  List<NewsPiece> fireNews = [
    NewsPiece(
      title: 'Fair News!',
      text: 'Some Fair news',
      icon: Icons.celebration,
    ),
    NewsPiece(
      title: 'Fair News!',
      text: 'One more Fair news',
      icon: Icons.celebration,
    ),
  ];

  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    currentNewsType = lateNews;
    super.initState();
  }

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
                      currentNewsType = lateNews;
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
                      currentNewsType = logisticsNews;
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
                      currentNewsType = politicNews;
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
                      currentNewsType = economyNews;
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
                      currentNewsType = fireNews;
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
                itemCount: currentNewsType.length,
                itemBuilder: (BuildContext context, int index) {
                  return currentNewsType[index];
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
      color: Colors.purple,
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
