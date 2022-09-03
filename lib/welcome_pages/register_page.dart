import 'package:all_log/welcome_pages/loading_screen.dart';
import '../components/rounded button.dart';
import 'package:flutter/material.dart';
import '../components/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegisterPage extends StatefulWidget {
  static String id = 'register_screen';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email = '';
  String password = '';
  Color passwordTextColor = Colors.yellow;

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
              color: Colors.deepOrange,
              buttonText: 'Зарегистрироваться',
              onTap: () async {
                setState(() {
                  showSpinner = true;
                });

                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if (newUser != null) {
                    Navigator.pushNamed(context, LoadingScreen.id);
                  }

                  setState(() {
                    showSpinner = false;
                  });
                } catch (e) {
                  Alert(
                    context: context,
                    type: AlertType.error,
                    title: "Пароль должен содержатьт минимум 6 символов",
                    desc: "Придумайте новый пароль",
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
