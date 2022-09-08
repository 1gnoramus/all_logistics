import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:all_log/welcome_pages/loading_screen.dart';
import '../components/rounded button.dart';
import 'package:flutter/material.dart';
import '../components/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';

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
                style: TextStyle(color: Colors.black38),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
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
              style: TextStyle(color: Colors.black38),
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
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
              onTap: () async {
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (user != null) {
                    Navigator.pushNamed(context, LoadingScreen.id);
                  } else {}
                } catch (e) {
                  Alert(
                    context: context,
                    type: AlertType.error,
                    title: "Неверно введены данные Вашего аккаунта",
                    desc: "Проверьте заполненные данные и попробуйте еще раз",
                    buttons: [
                      DialogButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'Повторить',
                          style: TextStyle(color: Colors.black38, fontSize: 20),
                        ),
                      ),
                    ],
                  ).show();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
