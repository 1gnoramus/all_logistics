import 'package:flutter/material.dart';
import 'package:all_log/welcome_pages/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:all_log/components/bottom_data.dart';

class ProfilePage extends StatefulWidget {
  static String id = 'profile_page';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _auth = FirebaseAuth.instance;

  String name = 'ФИО';
  int age = 21;
  String sex = 'Мужской';
  String phoneNumber = '+7-778-057-66-72';
  String email = 'a@mail.ru';
  String rank = 'А+';

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
        title: Text('Profile Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView(children: [
              Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              child: Center(
                                child: Text(
                                  'ФОТО',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.black),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 30.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('Редактировать',
                                  style: TextStyle(
                                      fontSize: 10.0, color: Colors.black54)),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            ProfileMainInfoPiece(
                              text: name,
                            ),
                            ProfileMainInfoPiece(
                              text: 'Возраст:   ${age.toString()}',
                            ),
                            ProfileMainInfoPiece(
                              text: 'Пол:  ${sex}',
                            ),
                            ProfileMainInfoPiece(
                              text: phoneNumber,
                            ),
                            ProfileMainInfoPiece(
                              text: email,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'A+',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 40.0, color: Colors.black),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(70.0))),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        ProfileMainInfoPiece(text: "Ваш рейтинг: $rank")
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          child: Center(
                            child: Icon(
                              Icons.graphic_eq,
                              size: 120.0,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            '*посмотрите как составляется график рейтинга',
                            style:
                                TextStyle(fontSize: 10.0, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.star_rate,
                              color: Colors.black,
                              size: 80,
                            ),
                            Text('4.8',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.black))
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text('Список отзывов',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.black))
                      ],
                    )
                  ],
                ),
              ),
            ]),
          ),
          BottomPanelWidget('Profile')
        ],
      ),
    );
  }
}

class ProfileMainInfoPiece extends StatelessWidget {
  ProfileMainInfoPiece({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12.0, color: Colors.black),
      ),
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      width: 200.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
    );
  }
}
