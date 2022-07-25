import 'package:all_log/register_page.dart';
import 'package:flutter/material.dart';
import 'order_page.dart';
import 'news_page.dart';
import 'package:all_log/welcome_page.dart';
import 'login_page.dart';
import 'package:all_log/register_page.dart';

void main() => runApp(AllLogistics());

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
