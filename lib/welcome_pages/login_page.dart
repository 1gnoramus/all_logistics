import 'package:all_log/main_pages/order_page.dart';
import '../components/rounded button.dart';
import 'package:flutter/material.dart';
import '../components/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
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
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.pushNamed(context, OrderPage.id);
                    } else {}
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    setState(() {
                      showSpinner = false;
                    });
                    print('Пароль неправильный, еблан');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
