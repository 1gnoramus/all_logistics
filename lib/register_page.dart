import 'components/rounded button.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class RegisterPage extends StatefulWidget {
  static String id = 'register_screen';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
              color: Colors.deepOrange,
              buttonText: 'Зарегистрироваться',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
