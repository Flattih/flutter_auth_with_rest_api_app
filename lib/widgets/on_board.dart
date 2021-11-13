import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/main.dart';
import 'package:flutter_appp/screens/auth_page.dart';
import 'package:flutter_appp/screens/home_page.dart';
import 'package:flutter_appp/services/auth.dart';
import 'package:provider/provider.dart';

class OnBoardWidget extends StatefulWidget {
  const OnBoardWidget({Key? key}) : super(key: key);

  @override
  _OnBoardWidgetState createState() => _OnBoardWidgetState();
}

class _OnBoardWidgetState extends State<OnBoardWidget> {
  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<Auth>(context, listen: false);
    return StreamBuilder<User?>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return snapshot.data != null ? HomePage() : AuthPage();
        } else {
          return SizedBox(
            height: 300,
            width: 300,
            child: CircularProgressIndicator(),
          );
        }
      },
      stream: _auth.authStatus(),
    );
  }
}
