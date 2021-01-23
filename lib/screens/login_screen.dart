import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                email = value;
              },
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              decoration: kInputDecorationTextFieldStyle.copyWith(
                hintText: 'Enter Your Email',
                enabledBorder: OutlineInputBorder().copyWith(
                  borderSide:
                      BorderSide().copyWith(color: Colors.lightBlueAccent),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration: kInputDecorationTextFieldStyle.copyWith(
                hintText: 'Enter Your Password',
                enabledBorder: OutlineInputBorder().copyWith(
                  borderSide:
                      BorderSide().copyWith(color: Colors.lightBlueAccent),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              color: Colors.lightBlueAccent,
              text: 'Log In',
              onPressed: () async{
                try{
                final registeredUser = await _auth.signInWithEmailAndPassword(email: email, password: password);
                if (registeredUser != null) {
                  Navigator.pushNamed(context, ChatScreen.id);
                }} catch(e){
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
