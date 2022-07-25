import 'components/rounded button.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/search.png'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {},
                decoration: kTextFieldInputDecoration.copyWith(
                    icon: Icon(
                      Icons.email_rounded,
                      size: 20.0,
                      color: Colors.orangeAccent,
                    ),
                    hintText: 'Введите почту')),
            SizedBox(
              height: 16.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {},
              decoration: kTextFieldInputDecoration.copyWith(
                  icon: Icon(
                    Icons.password,
                    size: 20.0,
                    color: Colors.orangeAccent,
                  ),
                  hintText: 'Введите пароль'),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              color: Colors.orangeAccent,
              buttonText: 'Войти',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
