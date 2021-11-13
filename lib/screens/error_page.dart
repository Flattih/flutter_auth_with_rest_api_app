import 'package:flutter/material.dart';
import 'package:flutter_appp/widgets/sign_in_button.dart';

class SomethingWrongScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/5_Something Wrong.png",
            fit: BoxFit.cover,
          ),

          Positioned(
            bottom: size.height * 0.1,
            left:  size.width * 0.1,
            right:  size.width * 0.1,
            child: SignInButton(align: Alignment.center,
              press: () {},
              icon: Icon(Icons.arrow_back),
              color: Colors.pink,
              text: "GO BACK",
              size: size,
            ),
          )
        ],
      ),
    );
  }
}
