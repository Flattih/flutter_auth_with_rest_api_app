import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class SignInButtonWithFaIcon extends StatelessWidget {
  const SignInButtonWithFaIcon({
    Key? key,
    required this.size,
    required this.text,
    required this.color,
    required this.press,
    required this.icon,
  }) : super(key: key);

  final Size size;
  final String text;
  final Color color;
  final VoidCallback press;
  final FaIcon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ElevatedButton.icon(
        label: Text(text),
        onPressed: press,
        style: ElevatedButton.styleFrom(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            primary: color,
            shape: StadiumBorder()),
        icon: icon,
      ),
    );
  }
}
