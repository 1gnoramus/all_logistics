import 'package:all_log/welcome_pages/register_page.dart';
import 'package:flutter/material.dart';
import 'main_pages/order_page.dart';
import 'main_pages/news_page.dart';
import 'package:all_log/welcome_pages/welcome_page.dart';
import 'welcome_pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'main_pages/info_page.dart';
import 'main_pages/history_page.dart';
import 'main_pages/profile_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AllLogistics());
}

class AllLogistics extends StatelessWidget {
  var logOrderData = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: (Color(0xFFE9FB47)),
        ),
        scaffoldBackgroundColor: Color(0xFFE9FB47),
      ),
      routes: {
        ProfilePage.id: (context) => ProfilePage(),
        HistoryPage.id: (context) => HistoryPage(),
        InfoPage.id: (context) => InfoPage(),
        RegisterPage.id: (context) => RegisterPage(),
        LoginPage.id: (context) => LoginPage(),
        WelcomePage.id: (context) => WelcomePage(),
        OrderPage.id: (context) => OrderPage(),
        NewsPage.id: (context) => NewsPage(),
      },
      initialRoute: WelcomePage.id,
    );
  }
}
