import 'package:flutter/material.dart';
import 'package:all_log/welcome_pages/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:all_log/components/bottom_data.dart';

class InfoPage extends StatefulWidget {
  static String id = 'info_page';
  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
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
        title: Text('Information Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.document_scanner,
                        size: 100.0,
                        color: Colors.lightBlueAccent,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        color: Colors.grey,
                        child: Text(
                          'Place for Picker',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        DocumentationPiece(
                          title: 'Информация в дорогу',
                          onTapDoc: () {},
                          onTapPdf: () {},
                        ),
                        DocumentationPiece(
                          title: 'Требования к транспорту',
                          onTapDoc: () {},
                          onTapPdf: () {},
                        ),
                        DocumentationPiece(
                          title: 'Состояние дорог',
                          onTapDoc: () {},
                          onTapPdf: () {},
                        ),
                        DocumentationPiece(
                          title: 'Правила дорожного движения',
                          onTapDoc: () {},
                          onTapPdf: () {},
                        ),
                        DocumentationPiece(
                          title: 'Пункты ТО',
                          onTapDoc: () {},
                          onTapPdf: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomPanelWidget()
        ],
      ),
    );
  }
}

class DocumentationPiece extends StatelessWidget {
  DocumentationPiece(
      {required this.title, required this.onTapDoc, required this.onTapPdf});

  final String title;
  final VoidCallback onTapDoc;
  final VoidCallback onTapPdf;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.pinkAccent,
            child: Text(
              '$title',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.0),
            ),
          ),
          SizedBox(
            width: 40.0,
          ),
          IconButton(
            onPressed: onTapPdf,
            icon: Icon(
              Icons.picture_as_pdf,
              size: 50.0,
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          IconButton(
            onPressed: onTapDoc,
            icon: Icon(
              Icons.save_as,
              size: 50.0,
            ),
          ),
        ],
      ),
    );
  }
}
