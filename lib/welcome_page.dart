import 'package:all_log/login_page.dart';
import 'package:all_log/register_page.dart';
import 'package:flutter/material.dart';
import 'components/rounded button.dart';

class WelcomePage extends StatefulWidget {
  static String id = 'welcome_page';

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/search.png'),
                    height: 80,
                  ),
                ),
                SizedBox(
                  width: 30.0,
                ),
                Text(
                  'AllLogistics',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 35.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: Colors.orangeAccent,
              onTap: () {
                Navigator.pushNamed(context, LoginPage.id);
              },
              buttonText: 'Авторизироваться',
            ),
            RoundedButton(
              color: Colors.deepOrange,
              onTap: () {
                Navigator.pushNamed(context, RegisterPage.id);
              },
              buttonText: 'Регистрация',
            ),
          ],
        ),
      ),
    );
  }
}
