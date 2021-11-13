import 'package:flutter/material.dart';
import 'package:flutter_appp/services/auth.dart';
import 'package:flutter_appp/widgets/fa_sign_in_button.dart';
import 'package:flutter_appp/widgets/sign_in_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(appBar: AppBar(title: Text("IMDB WİTH REST API "),centerTitle: true,backgroundColor: Colors.black,),
        body: Container(
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.bottomLeft,
                begin: Alignment.topRight,
                colors: [Colors.teal, Colors.black]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButton(
                align: Alignment.centerLeft,
                size: size,
                press: () async {
                  await Provider.of<Auth>(context, listen: false)
                      .signInAnonymously();
                },
                color: Colors.black,
                text: 'SIGN IN ANONYMOUSLY',
                icon: Icon(Icons.account_circle_rounded),
              ),
              SignInButtonWithFaIcon(
                  size: size,
                  icon: FaIcon(FontAwesomeIcons.google),
                  color: Colors.black,
                  press: () {Provider.of<Auth>(context,listen: false).signInWithGoogle();},
                  text: "SIGN IN WITH GOOGLE"),
            ],
          ),
        ),
      ),
    );
  }
}
