import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/screens/error_page.dart';
import 'package:flutter_appp/services/auth.dart';
import 'package:flutter_appp/widgets/fa_sign_in_button.dart';
import 'package:flutter_appp/widgets/on_board.dart';
import 'package:flutter_appp/widgets/sign_in_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<Auth>(
      create: (context) => Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return SomethingWrongScreen();
            } else if (snapshot.hasData) {
              return OnBoardWidget();
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
          future: _initialization,
        ),
      ),
    );
  }
}

