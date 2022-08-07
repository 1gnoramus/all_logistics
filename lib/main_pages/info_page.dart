import 'package:flutter/material.dart';
import 'package:all_log/welcome_pages/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:all_log/components/bottom_data.dart';
import 'package:all_log/components/constants.dart';

class InfoPage extends StatefulWidget {
  static String id = 'info_page';
  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final _auth = FirebaseAuth.instance;
  String selectedFolder = 'Информация в дорогу';

  List<DocumentationPiece> docsList = [];
  List<String> currentFolder = [];

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String folder in foldersList) {
      var newItem = DropdownMenuItem(
        child: Text(
          folder,
          style: TextStyle(fontSize: 15.0),
        ),
        value: folder,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      dropdownColor: Colors.blue,
      value: selectedFolder,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          if (value == 'Информация в дорогу') {
            docsList.clear();
            currentFolder = roadInfoFolder;
          } else if (value == 'Шаблоны сопроводительных \n документов') {
            docsList.clear();

            currentFolder = docsExamplesFolder;
          } else if (value == 'Разное') {
            docsList.clear();
            currentFolder = stuffFolder;
          }
          selectedFolder = value!;
        });
      },
    );
  }

  @override
  void initState() {
    currentFolder = roadInfoFolder;
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
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          height: 45.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          child: androidDropdown(),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: currentFolder.length,
                      itemBuilder: (BuildContext context, int index) {
                        for (var doc in currentFolder) {
                          final docPiece = DocumentationPiece(
                            title: doc,
                            onTapDoc: () {},
                            onTapPdf: () {},
                          );
                          docsList.add(docPiece);
                        }
                        return docsList[index];
                      },
                    ),
                  ),
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
      padding: EdgeInsets.only(right: 20.0, top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Material(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50.0),
              bottom: Radius.circular(20.0),
            ),
            elevation: 8.0,
            child: Container(
              width: 200.0,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50.0), bottom: Radius.circular(20.0)),
                color: Colors.orangeAccent,
              ),
              child: Center(
                child: Text(
                  '$title',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: onTapPdf,
              icon: Icon(
                Icons.picture_as_pdf,
                size: 40.0,
                color: Colors.red,
              ),
            ),
            maxRadius: 30.0,
          ),
          SizedBox(
            width: 10.0,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: onTapDoc,
              icon: Icon(
                Icons.save_as,
                size: 40.0,
                color: Colors.blue,
              ),
            ),
            maxRadius: 30.0,
          ),
        ],
      ),
    );
  }
}
